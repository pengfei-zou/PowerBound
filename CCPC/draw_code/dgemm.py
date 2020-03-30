import os.path
import sys
import re
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
import numpy
import openpyxl
import pandas
import math
global_step =1
def read(start, end, step,skip, pathfolder, label, power):
    data = []
    logdata = []
    for dir_entry in range(start,end+step,step):
        if dir_entry in skip: 
            continue
        datafname=os.path.join(pathfolder,label+str(dir_entry)+".data.txt")
        if(not os.path.exists(datafname)):
            print("%s does not exists\n", datafname)
            break
        data.append(readData(datafname,dir_entry))

        logfname=os.path.join(pathfolder,label+str(dir_entry)+".rapl_log.txt")
        if(not os.path.exists(logfname)):
            print("%s does not exists\n", logfname)
            break
        logdata.append(readLog(logfname,dir_entry))
    dataFilename = '%s.xlsx'%(label)
    data = numpy.asarray(data)
    print(data)
    logdata = numpy.asarray(logdata)
    dfData = pandas.DataFrame({'power_bound': data[:,0],
                           'Gflop': data[:,1]}, columns=['power_bound','Gflop'])
    dfLog = pandas.DataFrame({'power_bound': logdata[:,0],
                              'PKG(0+12)': logdata[:,1], 
                              'DRAM(0+12)': logdata[:,2],
                              'PPG+DRAM(0+12)': logdata[:,3],
                              'PKG(0)': logdata[:,4],
                              'PP0(0)': logdata[:,5],
                              'DRAM(0)': logdata[:,6],
                              'PKG(12)': logdata[:,7],
                              'PP0(12)': logdata[:,8],
                              'DRAM(12)': logdata[:,9]},
                               columns = ['power_bound','PKG(0+12)','DRAM(0+12)',
                                         'PPG+DRAM(0+12)','PKG(0)','PP0(0)','DRAM(0)',
                                          'PKG(12)','PP0(12)','DRAM(12)'])
    writer = pandas.ExcelWriter(os.path.join(pathfolder,dataFilename),engine='xlsxwriter')
    dfData.to_excel(writer,sheet_name='data',index=False)
    dfLog.to_excel(writer,sheet_name='log',index=False)
    writer.save()
def readData(datafname,power_bound):
    f = open(datafname,"r+")
    beginline = 5
    tempcount = 0    
    tempdata=[]
    tempdata.append(float(power_bound))
    
    for line in f:
        tempcount=tempcount+1
        if tempcount<beginline:
            continue
        else:
            d = line.split()                
            tempdata.append(float(d[2]));
            break
    f.close()     
    return tempdata

def readLog(logfname,power_bound):
    f = open(logfname,"r+")
    templog=[]
    # templog.append(float(problem_size))
    firstLine = True

    for line in f:
        line = line.rstrip()
        if firstLine:
            firstLine = False
            continue
        d  = line.split()
        # for wrong data in the rapl log file
        if len(d) == 9:
            templog.append( [float(d[0]), float(d[2])+float(d[6]), float(d[4])+float(d[8]), \
                            float(d[2])+float(d[6])+float(d[4])+float(d[8]), float(d[2]),\
                            float(d[3]), float(d[4]), float(d[6]), float(d[7]), float(d[8]) ] )
    f.close()
    power = summarize(templog)
    power.insert(0,float(power_bound))
    return power

def summarize(templog):
    prevTime = templog[0][0]
    startTime = prevTime
        
    n = len(templog[0])
    energy = []
    for i in range(n-1):
        energy.append(0.0)
            
    for d in templog: 
        validData = True
        for v in d:
            if v < 0 :
                validData = False
        if validData == False:
            continue
            
        currTime = d[0]
                
        for i in range(n-1):
            energy[i] = energy[i] + d[i+1] * (currTime-prevTime)
        prevTime = currTime
        
    #print "time=", currTime, startTime, currTime - startTime
    tmppower=[]
    duration = currTime - startTime
    for i in range(n-1):
        tmppower.append(energy[i] / duration)
    return tmppower   

def DrawPerf(pathfolder, power, label):

    datafile = os.path.join(pathfolder,'%s.xlsx'%(label))    
    data = pandas.read_excel(datafile,parse_cols='A,B',sheetname='data')
    data_array = data.values[:]
    fig = plt.figure(dpi=600)
    ax1 = fig.add_subplot(111)
    ax2 = ax1.twiny()
    Xbottom =  data_array[:,0]*2
 
    
    line1, = ax1.plot(Xbottom,data_array[:,1],'r-->',ms=10,mfc='k',lw =2)
    ax1.set_xlabel(r"$P_{mem}$ (Watts)")
    ax1.set_ylabel("Average Gflop/s")  
    xtickStart =  0
    xtickEnd = math.ceil(max(Xbottom)/10)*10
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    numXtick = 6
    if (len(xticksMajor) < numXtick):
        xticksMajor = numpy.linspace(xtickStart,xtickEnd,numXtick)
    xticksMajor = xticksMajor.astype(int)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both', length=8, width=2,pad=12,labelsize = 28)
    #ax1.tick_params(axis = 'both', which = 'minor', labelsize = 0)

    numYtick=5
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data_array[:,1])*1.1/3/numYtick)*3*numYtick 
    ax1.set_ylim([0,ytickEnd])       
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
    ax1.set_yticks(yticksMajor)
    ax1.grid(True,which='major',linestyle='--')


    ax2.set_xlim(ax1.get_xlim())
    ax2.set_xticks(xticksMajor)
    ax2.set_xticklabels(int(power)-xticksMajor)
    ax2.set_xlabel(r"$P_{cpu}$ (Watts)") 
    ax2.tick_params(length=8, width=2,pad=12,labelsize = 28)
    ax2.tick_params(axis='x',pad=8)

    fig.tight_layout()
    ax2.set_title("Performance of dgemm ($\mathbf{P_{ub}}$=%iW)" %(power),fontsize = 32, fontweight='bold',y=1.15)
   # fig.subplots_adjust(top=0.85)
    font = {
            'size'   : 30}

    matplotlib.rc('font', **font)
    
    fig.set_size_inches(16,12)
    fig.savefig(os.path.join(pathfolder,'dgemm_Perf%iw.png' %(power)),bbox_inches='tight')  
    plt.close(fig)
def DrawActuralPower(pathfolder, power, label):

    datafile = os.path.join(pathfolder,'%s.xlsx'%(label))    
    data = pandas.read_excel(datafile,parse_cols='A,B,C,D',sheetname='log')
    data_array = data.values[:]
    fig = plt.figure(dpi=600)
    ax1 = fig.add_subplot(111)
    ax2 = ax1.twiny()
    Xbottom =  data_array[:,0]*2

    
    line1, = ax1.plot(Xbottom,data_array[:,1],'r-->',ms=10,mfc='r',lw =2)
    line2, = ax1.plot(Xbottom,data_array[:,2],'g--o',ms=10,mfc='g',lw =2)
    line3, = ax1.plot(Xbottom,data_array[:,3],'b--*',ms=10,mfc='b',lw =2)
    ax1.legend([line1,line2,line3],['PKG','DRAM','PKG+DRAM'],prop={'size':18})
    ax1.set_ylabel(r"Actual Power (Watts)")   #for Actual power
    xtickStart =  0
    xtickEnd = math.ceil(max(Xbottom)/10)*10
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    numXtick = 6
    if (len(xticksMajor) < numXtick):
        xticksMajor = numpy.linspace(xtickStart,xtickEnd,numXtick)
    xticksMajor = xticksMajor.astype(int)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    ax1.set_xlabel(r"$P_{mem}$ (Watts)") 
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both',  length=8, width=2, pad=12,labelsize = 28)
    #ax1.tick_params(axis = 'both', labelsize = 0)

    numYtick=5
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data_array[:,3])/40/numYtick)*40*numYtick
    ytickEnd =200
    ax1.set_ylim([0,ytickEnd])       #for kilo update
    #yticks = [0,5000,10000,15000,20000,25000,30000]    #for kilo update
    #ytickStep = 2
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
   
    ax1.set_yticks(yticksMajor)  #for kilo update
    #ax1.set_yticks(yticksMinor,minor=True)
    ax1.grid(True,which='major',linestyle='--')


    ax2.set_xlim(ax1.get_xlim())
    ax2.set_xticks(xticksMajor)
    ax2.set_xticklabels(int(power)-xticksMajor)
    ax2.set_xlabel(r"$P_{cpu}$ (Watts)") 
    ax2.tick_params(length=8, width=2, pad=12,labelsize = 28)
    ax2.tick_params(axis='x',pad=8)

   
    fig.tight_layout()
    ax2.set_title("Actual Power of dgemm ($\mathbf{P_{ub}}$=%iW)" %(power),fontsize = 32, fontweight='bold',y=1.15)
    fig.subplots_adjust(top=0.85)
    font = {
            'size'   : 30}

    matplotlib.rc('font', **font)
    
    fig.set_size_inches(16,12)
    fig.savefig(os.path.join(pathfolder,'degemm_Power%iw.png' %(power)))  #for actual power
    plt.close(fig)
def DrawPerfPower(pathfolder, power, label):
    
    datafile = os.path.join(pathfolder,'%s.xlsx'%(label))    
    dataGlop = pandas.read_excel(datafile,parse_cols='A,B',sheetname='data')
    dataPower = pandas.read_excel(datafile,parse_cols='A,B,C,D',sheetname='log')
    data_array = dataGlop.values[:]
    fig = plt.figure(dpi=600)
    ax1 = fig.add_subplot(111)
    ax2 = ax1.twiny()
    ax3 = ax1.twinx()
    Xbottom =  data_array[:,0]*2
 
    
    line1 = ax1.plot(Xbottom,data_array[:,1],'r-->',ms=10,mfc='k',lw =2,label='Peformance')
    ax1.set_xlabel(r"$P_{mem}$ (Watts)")
    ax1.set_ylabel("Performance (Average Gflop/s)")  
    #xtickStart =  math.floor(min(Xbottom)/10)*10
    xtickStart =  0
    xtickEnd = math.ceil(max(Xbottom)/10)*10
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    numXtick = 6
    if (len(xticksMajor) < numXtick):
        xticksMajor = numpy.linspace(xtickStart,xtickEnd,numXtick)
    xticksMajor = xticksMajor.astype(int)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both', length=8, width=2,pad=12,labelsize = 28)
    #ax1.tick_params(axis = 'both', which = 'minor', labelsize = 0)

    numYtick=5
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data_array[:,1])/3/numYtick)*3*numYtick 
    ax1.set_ylim([0,ytickEnd])       #for kilo update
    #yticks = [0,5000,10000,15000,20000,25000,30000]    #for kilo update
    #ytickStep = 2
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
   
    ax1.set_yticks(yticksMajor)  #for kilo update
    #ax1.set_yticks(yticksMinor,minor=True)
    ax1.grid(True,which='major',linestyle='--')


    ax2.set_xlim(ax1.get_xlim())
    ax2.set_xticks(xticksMajor)
    ax2.set_xticklabels(int(power)-xticksMajor)
    ax2.set_xlabel(r"$P_{cpu}$ (Watts)") 
    ax2.tick_params(axis = 'x',  length=8, width=2,pad=12,labelsize = 28)
    #ax2.tick_params(axis = 'x', which = 'minor', labelsize = 0)

    data_array = dataPower.values[:,3]
    #ytickStart = math.floor(min(data_array[:,1] /40 ))*40
    ytickStart=0
    ytickEnd = math.ceil(max(data_array[:])*1.1/10/numYtick)*10*numYtick
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
    ax3.set_ylim([ytickStart,ytickEnd])
    ax3.set_yticks(yticksMajor)  
    ax3.tick_params(axis = 'y', which = 'major', length=8, width=2,pad=12,labelsize = 28)
    #ax3.tick_params(axis = 'y', which = 'minor', labelsize = 0)
    line2 = ax3.plot(Xbottom,data_array[:],'g--o',ms=10,mfc='g',lw =2,label='Actual Power')
    ax3.set_ylabel(r"Actual Power (Watts)")

    lns =line1+line2
    labs = [l.get_label() for l in lns]
    ax1.legend(lns,labs,loc=0,prop={'size':22})
    #fig.legend([line1,line2],['Gflop','Power Consumption']) 
    fig.tight_layout()
    ax2.set_title("$P_{ub}$ = %iW" %(power),fontsize = 32, fontweight='bold',y=1.15)
    fig.subplots_adjust(top=0.85)
    font = {
            'size'   : 30}

    matplotlib.rc('font', **font)
    
    fig.set_size_inches(16,12)
    fig.savefig(os.path.join(pathfolder,'dgemm_PerfPower%iw.png' %(power))) 
    plt.close(fig)
def DrawAllPerf(pathfolder):

    datafile = os.path.join(pathfolder,'dgemm_All.xlsx')    
    data = pandas.read_excel(datafile,parse_cols='A:I',sheetname='data')
   
    fig = plt.figure(dpi=600)
    ax1 = fig.add_subplot(111)
    #ax2 = ax1.twiny()
    Xbottom =  data['ram'].values
    #data_array[:,1:end]=  data_array[:,1:end] 
    line0, = ax1.plot(Xbottom,data[' 72w'].values ,'k-o',ms=10,mfc='k',lw =2)
    line1, = ax1.plot(Xbottom,data[' 80w'].values ,'r-->',ms=10,mfc='r',lw =2)
    line2, = ax1.plot(Xbottom,data['100w'].values ,'g-o',ms=10,mfc='g',lw =2)
    line3, = ax1.plot(Xbottom,data['120w'].values ,'b-->',ms=10,mfc='b',lw =2)
    line4, = ax1.plot(Xbottom,data['140w'].values ,'c-o',ms=10,mfc='c',lw =2)
    line5, = ax1.plot(Xbottom,data['160w'].values ,'m-->',ms=10,mfc='m',lw =2)
    line6, = ax1.plot(Xbottom,data['180w'].values ,'y-o',ms=10,mfc='y',lw =2)
    line7, = ax1.plot(Xbottom,data['200w'].values ,'k-->',ms=10,mfc='k',lw =2)
   
   # line8, = ax1.plot(Xbottom,data_array[:,8] ,color='pink',linestyle='-',ms,ms=10,mfc='pink',lw =2)

#    line9, = ax1.plot(Xbottom,data_array[:,9] ,'r-o',ms=10,mfc='r',lw =2)
#    line10, = ax1.plot(Xbottom,data_array[:,10] ,'g-->',ms=10,mfc='g',lw =2)
#    line11, = ax1.plot(Xbottom,data_array[:,11] ,'b-o',ms=10,mfc='b',lw =2)
#    line12, = ax1.plot(Xbottom,data_array[:,12] ,'c-->',ms=10,mfc='c',lw =2)
#    line13, = ax1.plot(Xbottom,data_array[:,13] ,'m-o',ms=10,mfc='m',lw =2)

#    #line14, = ax1.plot(Xbottom,data_array[:,14] ,'y-->',ms=10,mfc='y',lw =2)
    
#    line15, = ax1.plot(Xbottom,data_array[:,15] ,'k-o',ms=10,mfc='k',lw =2)
#    line16, = ax1.plot(Xbottom,data_array[:,16] ,color='pink',linestyle='--',ms=10,mfc='pink',lw =2)
    ax1.set_xlabel(r"$P_{mem}$ (Watts)")
    ax1.set_ylabel("Performance (Average Gflops/s)")  
    xtickStart =  0
    xtickEnd = math.ceil(max(Xbottom)/10)*10
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both', length=8, width=2,pad=12, labelsize = 28)
    #ax1.tick_params(axis = 'both', which = 'minor', labelsize = 0)

    numYtick=5
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data['200w'].values)*1.1/global_step/numYtick)*numYtick*global_step 
    ax1.set_ylim([0,ytickEnd])       
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
    ax1.set_yticks(yticksMajor)
    ax1.grid(True,which='major',linestyle='--')
    ax1.legend([line0,line1,line2,line3,line4,line5,line6,line7],
            ['72w','80w','100w','120w','140w','160','180w','200w'],prop={'size':22},title="$\mathbf{P_{ub}}$")
    ax1.get_legend().get_title().set_fontsize(22)
#                ['80w','88w','96w','100w','108w','116w','120w','128w','136w',
#            '140w','148w','156w','160w','168w','176w','180w'],prop={'size':18})

#    #ax2.set_xlim(ax1.get_xlim())
#    #ax2.set_xticks(xticksMajor)
#    #ax2.set_xticklabels(int(power)-xticksMajor)
#    #ax2.set_xlabel(r"Power Bound on PKG Modules (Watts)") 
#    #ax2.tick_params(length=8, width=2,pad=12)
#    #ax2.tick_params(axis='x',pad=8)

    fig.tight_layout()
    ax1.set_title("Performance Profiles of star dgemm" ,fontsize = 32, fontweight='bold',y=1.08)
    fig.subplots_adjust(top=0.85)
    #font = {'family' : 'sans-serif','sans-serif':['Helvetica'],
    #        'weight' : 'bold',
    #        'size'   : 22}
    font = {
        'size'   : 30}
    matplotlib.rc('font', **font)
    
    fig.set_size_inches(16,12)
    #benchname=benchname.replace(' ','_')
    #benchname=benchname.replace('.','_')
    fig.savefig(os.path.join(pathfolder,'dgemm_All_perf.png'),bbox_inches='tight') 
    plt.close(fig)
def DrawAllPower(pathfolder):

    datafile = os.path.join(pathfolder,'dgemm_All.xlsx')    
    data = pandas.read_excel(datafile,parse_cols='A:I',sheetname='totalpower')
   
    fig = plt.figure(dpi=600)
    ax1 = fig.add_subplot(111)
    #ax2 = ax1.twiny()
    Xbottom =  data['ram'].values
    #data_array[:,1:end]=  data_array[:,1:end] 
    line0, = ax1.plot(Xbottom,data[' 72w'].values ,'k-o',ms=10,mfc='k',lw =2)
    line1, = ax1.plot(Xbottom,data[' 80w'].values ,'r-->',ms=10,mfc='r',lw =2)
    line2, = ax1.plot(Xbottom,data['100w'].values ,'g-o',ms=10,mfc='g',lw =2)
    line3, = ax1.plot(Xbottom,data['120w'].values ,'b-->',ms=10,mfc='b',lw =2)
    line4, = ax1.plot(Xbottom,data['140w'].values ,'c-o',ms=10,mfc='c',lw =2)
    line5, = ax1.plot(Xbottom,data['160w'].values ,'m-->',ms=10,mfc='m',lw =2)
    line6, = ax1.plot(Xbottom,data['180w'].values ,'y-o',ms=10,mfc='y',lw =2)
    line7, = ax1.plot(Xbottom,data['200w'].values ,'k-->',ms=10,mfc='k',lw =2)
   
   # line8, = ax1.plot(Xbottom,data_array[:,8] ,color='pink',linestyle='-',ms,ms=10,mfc='pink',lw =2)

#    line9, = ax1.plot(Xbottom,data_array[:,9] ,'r-o',ms=10,mfc='r',lw =2)
#    line10, = ax1.plot(Xbottom,data_array[:,10] ,'g-->',ms=10,mfc='g',lw =2)
#    line11, = ax1.plot(Xbottom,data_array[:,11] ,'b-o',ms=10,mfc='b',lw =2)
#    line12, = ax1.plot(Xbottom,data_array[:,12] ,'c-->',ms=10,mfc='c',lw =2)
#    line13, = ax1.plot(Xbottom,data_array[:,13] ,'m-o',ms=10,mfc='m',lw =2)

#    #line14, = ax1.plot(Xbottom,data_array[:,14] ,'y-->',ms=10,mfc='y',lw =2)
    
#    line15, = ax1.plot(Xbottom,data_array[:,15] ,'k-o',ms=10,mfc='k',lw =2)
#    line16, = ax1.plot(Xbottom,data_array[:,16] ,color='pink',linestyle='--',ms=10,mfc='pink',lw =2)
    ax1.set_xlabel(r"$P_{mem}$(Watts)")
    ax1.set_ylabel("Power (Watts)")  
    xtickStart =  0
    xtickEnd = math.ceil(max(Xbottom)/10)*10
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both', length=8, width=2,pad=12, labelsize = 28)
    #ax1.tick_params(axis = 'both', which = 'minor', labelsize = 0)

    numYtick=6
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data['200w'].values)*1.1/10/numYtick)*10*numYtick
    ytickEnd =180 
    ax1.set_ylim([0,ytickEnd])       
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
    ax1.set_yticks(yticksMajor)
    ax1.grid(True,which='major',linestyle='--')
    ax1.legend([line0,line1,line2,line3,line4,line5,line6,line7],
            ['72w','80w','100w','120w','140w','160','180w','200w'],prop={'size':22},title="$\mathbf{P_{ub}}$")
    ax1.get_legend().get_title().set_fontsize(22)
#                ['80w','88w','96w','100w','108w','116w','120w','128w','136w',
#            '140w','148w','156w','160w','168w','176w','180w'],prop={'size':18})

#    #ax2.set_xlim(ax1.get_xlim())
#    #ax2.set_xticks(xticksMajor)
#    #ax2.set_xticklabels(int(power)-xticksMajor)
#    #ax2.set_xlabel(r"Power Bound on PKG Modules (Watts)") 
#    #ax2.tick_params(length=8, width=2,pad=12)
#    #ax2.tick_params(axis='x',pad=8)

    fig.tight_layout()
    ax1.set_title("Power Profiles of star dgemm",fontsize = 32, fontweight='bold',y=1.06)
    fig.subplots_adjust(top=0.85)
    #font = {'family' : 'sans-serif','sans-serif':['Helvetica'],
    #        'weight' : 'bold',
    #        'size'   : 22}
    font = {
        'size'   : 30}
    matplotlib.rc('font', **font)
    
    fig.set_size_inches(16,12)
    #benchname=benchname.replace(' ','_')
    #benchname=benchname.replace('.','_')
    fig.savefig(os.path.join(pathfolder,'dgemm_totalpower.png'),bbox_inches='tight')
    plt.close(fig)

def CombineData(pathfolder,powerlist,filelist):
    fileName = os.path.join(pathfolder,'dgemm_All.xlsx')
    if len(powerlist) != len(filelist):
        return
    columns = []
    perf ={}    
    totalpower = {}
    pkgpower={}
    drampower={}
    data = pandas.read_excel(os.path.join(pathfolder,filelist[len(filelist)-1]),parse_cols='A',sheetname='data')
    perf['ram']= data.values[:,0]*2
    totalpower['ram']= data.values[:,0]*2
    pkgpower['ram']= data.values[:,0]*2
    drampower['ram']= data.values[:,0]*2
    columns.append('ram')
    
    for i in range(len(powerlist)):
        data = pandas.read_excel(os.path.join(pathfolder,filelist[i]),parse_cols='B',sheetname='data')
        perf['%3dw'%powerlist[i]]=data.values[:,0]
        data = pandas.read_excel(os.path.join(pathfolder,filelist[i]),parse_cols='B,C,D',sheetname='log')
        pkgpower['%3dw'%powerlist[i]]=data.values[:,0]
        drampower['%3dw'%powerlist[i]]=data.values[:,1]
        totalpower['%3dw'%powerlist[i]]=data.values[:,2]
        columns.append('%3dw'%powerlist[i])
    

    
    
    perf = dict([ (k,pandas.Series(v)) for k,v in perf.items() ])
    pkgpower = dict([ (k,pandas.Series(v)) for k,v in pkgpower.items() ])
    drampower = dict([ (k,pandas.Series(v)) for k,v in drampower.items() ])
    totalpower = dict([ (k,pandas.Series(v)) for k,v in totalpower.items() ])
    perfData = pandas.DataFrame(perf,columns=columns )
    pkgpowerData = pandas.DataFrame(pkgpower,columns=columns )
    drampowerData = pandas.DataFrame(drampower,columns=columns )
    totalpowerData = pandas.DataFrame(totalpower,columns=columns )
    writer = pandas.ExcelWriter(os.path.join(pathfolder,fileName),engine='xlsxwriter')
    perfData.to_excel(writer,sheet_name='data',index=False)
    pkgpowerData.to_excel(writer,sheet_name='pkgpower',index=False)
    drampowerData.to_excel(writer,sheet_name='drampower',index=False)
    totalpowerData.to_excel(writer,sheet_name='totalpower',index=False)
    #dfLog.to_excel(writer,sheet_name='log',index=False)
    writer.save()  



def DrawAllPerf_S(pathfolder):

    datafile = os.path.join(pathfolder,'dgemm_All.xlsx')    
    data = pandas.read_excel(datafile,parse_cols='A:J',sheetname='data')
   
    fig = plt.figure(dpi=600)
    ax1 = fig.add_subplot(111)
    #ax2 = ax1.twiny()
    Xbottom =  data['ram'].values
    #data_array[:,1:end]=  data_array[:,1:end] 

    line0, = ax1.plot(Xbottom,data[' 72w'].values ,'k->',ms=10,mfc='k',lw =2)
    line1, = ax1.plot(Xbottom,data[' 80w'].values ,'r--o',ms=10,mfc='r',lw =2)
    line2, = ax1.plot(Xbottom,data['100w'].values ,'g-.p',ms=10,mfc='g',lw =2)
    line3, = ax1.plot(Xbottom,data['110w'].values ,c=(0.9412,0.4706,0),ls='--',marker='h',ms=10,mfc=(0.9412,0.4706,0),lw =2)
    line4, = ax1.plot(Xbottom,data['120w'].values ,'b-*',ms=10,mfc='b',lw =2)
    line5, = ax1.plot(Xbottom,data['140w'].values ,'c--^',ms=10,mfc='c',lw =2)
    line6, = ax1.plot(Xbottom,data['160w'].values ,'m-.h',ms=10,mfc='m',lw =2)
    line7, = ax1.plot(Xbottom,data['180w'].values ,'y-d',ms=10,mfc='y',lw =2)
    line8, = ax1.plot(Xbottom,data['200w'].values ,c=(0.502, 0.502,1),ls='--',marker='<',ms=10,mfc=(0.502, 0.502,1),lw =2)

    #line0, = ax1.plot(Xbottom,data[' 72w'].values ,'k->',ms=10,mfc='k',lw =2)
    #line1, = ax1.plot(Xbottom,data[' 80w'].values ,'r--o',ms=10,mfc='r',lw =2)
    #line2, = ax1.plot(Xbottom,data['100w'].values ,'g-.p',ms=10,mfc='g',lw =2)
    #line3, = ax1.plot(Xbottom,data['120w'].values ,'b-*',ms=10,mfc='b',lw =2)
    #line4, = ax1.plot(Xbottom,data['140w'].values ,'c--^',ms=10,mfc='c',lw =2)
    #line5, = ax1.plot(Xbottom,data['160w'].values ,'m-.h',ms=10,mfc='m',lw =2)
    #line6, = ax1.plot(Xbottom,data['180w'].values ,'y-d',ms=10,mfc='y',lw =2)
    #line7, = ax1.plot(Xbottom,data['200w'].values ,'k--<',ms=10,mfc='k',lw =2) 

    #line0, = ax1.plot(Xbottom,data[' 72w'].values ,'k-o',ms=10,mfc='k',lw =2)
    #line1, = ax1.plot(Xbottom,data[' 80w'].values ,'r-->',ms=10,mfc='r',lw =2)
    #line2, = ax1.plot(Xbottom,data['100w'].values ,'g-.x',ms=10,mfc='g',lw =2)
    #line3, = ax1.plot(Xbottom,data['110w'].values ,'b-<',ms=10,mfc='b',lw =2)
    #line4, = ax1.plot(Xbottom,data['120w'].values ,'c--p',ms=10,mfc='c',lw =2)
    #line5, = ax1.plot(Xbottom,data['140w'].values ,'m-.*',ms=10,mfc='m',lw =2)
    #line6, = ax1.plot(Xbottom,data['160w'].values ,'y--^',ms=10,mfc='y',lw =2)
    #line7, = ax1.plot(Xbottom,data['180w'].values ,'k-h',ms=10,mfc='k',lw =2)
    #line8, = ax1.plot(Xbottom,data['200w'].values ,'r--d',ms=10,mfc='r',lw =2)
   
   # line8, = ax1.plot(Xbottom,data_array[:,8] ,color='pink',linestyle='-',ms,ms=10,mfc='pink',lw =2)

#    line9, = ax1.plot(Xbottom,data_array[:,9] ,'r-o',ms=10,mfc='r',lw =2)
#    line10, = ax1.plot(Xbottom,data_array[:,10] ,'g-->',ms=10,mfc='g',lw =2)
#    line11, = ax1.plot(Xbottom,data_array[:,11] ,'b-o',ms=10,mfc='b',lw =2)
#    line12, = ax1.plot(Xbottom,data_array[:,12] ,'c-->',ms=10,mfc='c',lw =2)
#    line13, = ax1.plot(Xbottom,data_array[:,13] ,'m-o',ms=10,mfc='m',lw =2)

#    #line14, = ax1.plot(Xbottom,data_array[:,14] ,'y-->',ms=10,mfc='y',lw =2)
    
#    line15, = ax1.plot(Xbottom,data_array[:,15] ,'k-o',ms=10,mfc='k',lw =2)
#    line16, = ax1.plot(Xbottom,data_array[:,16] ,color='pink',linestyle='--',ms=10,mfc='pink',lw =2)
    ax1.set_xlabel(r"$P_{mem}$ (Watts)")
    ax1.set_ylabel("Performance (Average Gflops/s)")  
    xtickStart =  0
    xtickEnd = math.ceil(max(Xbottom)/10)*10
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both', length=8, width=2,pad=12, labelsize = 28)
    #ax1.tick_params(axis = 'both', which = 'minor', labelsize = 0)

    numYtick=5
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data['200w'].values)*1.1/global_step/numYtick)*numYtick*global_step 
    ax1.set_ylim([0,ytickEnd])       
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
    ax1.set_yticks(yticksMajor)
    ax1.grid(True,which='major',linestyle='--')
    ax1.legend([line0,line1,line2,line3,line4,line5,line6,line7,line8],
            ['72w','80w','100w','110w','120w','140w','160','180w','200w'],prop={'size':22},title="$\mathbf{P_{ub}}$")
    ax1.get_legend().get_title().set_fontsize(22)
#                ['80w','88w','96w','100w','108w','116w','120w','128w','136w',
#            '140w','148w','156w','160w','168w','176w','180w'],prop={'size':18})

#    #ax2.set_xlim(ax1.get_xlim())
#    #ax2.set_xticks(xticksMajor)
#    #ax2.set_xticklabels(int(power)-xticksMajor)
#    #ax2.set_xlabel(r"Power Bound on PKG Modules (Watts)") 
#    #ax2.tick_params(length=8, width=2,pad=12)
#    #ax2.tick_params(axis='x',pad=8)

    fig.tight_layout()
    ax1.set_title("Performance Profiles of star dgemm" ,fontsize = 32, fontweight='bold',y=1.08)
    fig.subplots_adjust(top=0.85)
    #font = {'family' : 'sans-serif','sans-serif':['Helvetica'],
    #        'weight' : 'bold',
    #        'size'   : 22}
    font = {
        'size'   : 30}
    matplotlib.rc('font', **font)
    
    fig.set_size_inches(16,12)
    #benchname=benchname.replace(' ','_')
    #benchname=benchname.replace('.','_')
    fig.savefig(os.path.join(pathfolder,'dgemm_All_perf.png'),bbox_inches='tight') 
    plt.close(fig)