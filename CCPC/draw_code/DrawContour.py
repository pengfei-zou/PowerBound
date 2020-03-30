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

def read(pkgstart, pkgend, ramstart,ramend, step, pathfolder,skip):
    data = numpy.zeros(((pkgend-pkgstart)//step+1,(ramend-ramstart)//step+1))

    for x in range(pkgstart,pkgend+step,step):
        for y in range(ramstart,ramend+step,step):
            if [x,y] in skip:
                continue
            datafname=os.path.join(pathfolder,'rdAccessPkg'+str(x)+'Dram'+str(y)+".data.txt")
            if(not os.path.exists(datafname)):
                print("%s does not exists\n", datafname)
                break
            y_index = (x-pkgstart)//step
            x_index = (y-ramstart)//step
            data[y_index,x_index]=readData(datafname)

    dataDict ={}
    for y in range(ramstart,ramend+step,step):
        dataDict[y] = data[:,(y-ramstart)//step]

    dataFilename = 'ALL.xlsx'
    dfData = pandas.DataFrame(dataDict)
   
    writer = pandas.ExcelWriter(os.path.join(pathfolder,dataFilename),engine='xlsxwriter')
    dfData.to_excel(writer,sheet_name='data',index=False)
    #dfLog.to_excel(writer,sheet_name='log',index=False)
    writer.save()

def read2( pathfolder):
   
    ram = range(8, 71, 2)
    total = [72, 80, 88, 100, 116, 120, 128, 136, 148, 156, 176, 180]
    dataDict ={}
    for total_pb in total:
        temp_data = []
        for mem_pb in ram:
            pkg_pb = total_pb//2 - mem_pb
 
            datafname=os.path.join(pathfolder,'rdAccessPkg'+str(pkg_pb)+'Dram'+str(mem_pb)+".data.txt")
            if(not os.path.exists(datafname)):
                print("%s does not exists\n"%datafname)
                break
            temp_data.append(readData(datafname))
        dataDict[str(total_pb)]   = temp_data

   
    dataDict["mem_pb"] = ram
    dataFilename = 'RA.xlsx'
    dfData = pandas.DataFrame(dict([ (k, pandas.Series(v)) for k, v in dataDict.items()]), columns=["mem_pb", '72', '80','88','100', '116', '120', '128', '136', '148', '156', '176', '180'])
   
    writer = pandas.ExcelWriter(os.path.join(pathfolder,dataFilename),engine='xlsxwriter')
    dfData.to_excel(writer,sheet_name='data',index=False)
    #dfLog.to_excel(writer,sheet_name='log',index=False)
    writer.save()
def readPower(pkgstart, pkgend, ramstart,ramend, step, pathfolder,skip):
    data = numpy.zeros(((pkgend-pkgstart)//step+1,(ramend-ramstart)//step+1))

    for x in range(pkgstart,pkgend+step,step):
        for y in range(ramstart,ramend+step,step):
            if [x,y] in skip:
                continue
            datafname=os.path.join(pathfolder,'rdAccessPkg'+str(x)+'Dram'+str(y)+".rapl_log.txt")
            if(not os.path.exists(datafname)):
                print("%s does not exists\n", datafname)
                break
            y_index = (x-pkgstart)//step
            x_index = (y-ramstart)//step
            data[y_index,x_index]=readLog(datafname)

    dataDict ={}
    for y in range(ramstart,ramend+step,step):
        dataDict[y] = data[:,(y-ramstart)//step]

    dataFilename = 'PowerALL.xlsx'
    dfData = pandas.DataFrame(dataDict)
   
    writer = pandas.ExcelWriter(os.path.join(pathfolder,dataFilename),engine='xlsxwriter')
    dfData.to_excel(writer,sheet_name='TotalPower',index=False)
    #dfLog.to_excel(writer,sheet_name='log',index=False)
    writer.save()
def readData(datafname):
    f = open(datafname,"r+")
    beginline = 12
    tempcount = 0    
    
    for line in f:
        tempcount=tempcount+1
        if tempcount<beginline:
            continue
        else:
            d = line.split()                
            tempdata = (float(d[2])*1000)
            break
    f.close()     
    return tempdata

def readLog(logfname):
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
    return power[2]
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

    

def Drawcontour(pkgstart, pkgend, ramstart,ramend, step, pathfolder):
    #pathfolder =r'C:\Users\Pengf\OneDrive\projects\starRandomAccess_pzou\02_11'
    

  
    
    
    fileName = os.path.join(pathfolder,'All.xlsx')
    data = pandas.read_excel(fileName,parse_cols='A:AP',sheetname='data')
    
    fig = plt.figure(dpi=600)
    X =numpy.linspace(pkgstart,pkgend,(pkgend-pkgstart)//step+1)
    Y =numpy.linspace(ramstart,ramend,(ramend-ramstart)//step+1)
    plt.contour(Y,X,data.values[:])
    fig.set_size_inches(16,12)
    font = {'family' : 'sans-serif','sans-serif':['Helvetica'],
            'weight' : 'bold',
            'size'   : 24}

    matplotlib.rc('font', **font)
    fig.savefig(os.path.join(pathfolder,'contour.jpg'))  

def GetLinesData(pkgstart, pkgend, ramstart,ramend, step, pathfolder, powerlist):
    fileName = os.path.join(pathfolder,'All.xlsx')
    data = pandas.read_excel(fileName,parse_cols='A:AP',sheetname='data')
    dataDict ={}
    dataDict['ram']= numpy.linspace(ramstart,ramend,(ramend-ramstart)//step+1)
    for power in powerlist:
        ar = []
        for rampower in range(ramstart,ramend,step):
            totalpower = power //2
            pkgpower = totalpower - rampower
            if pkgpower < pkgstart:
                break
            ar.append(data.values[(pkgpower-pkgstart)//step,(rampower-ramstart)//step])
        dataDict['%3dw'%power] = ar
    dataDict = dict([ (k,pandas.Series(v)) for k,v in dataDict.items() ])
    dataFilename = 'Perf2.xlsx'
    dfData = pandas.DataFrame(dataDict)
   
    writer = pandas.ExcelWriter(os.path.join(pathfolder,dataFilename),engine='xlsxwriter')
    dfData.to_excel(writer,sheet_name='data',index=False)
    #dfLog.to_excel(writer,sheet_name='log',index=False)
    writer.save()


def DrawKilo(pathfolder):

    datafile = os.path.join(pathfolder,'RA.xlsx')    
    data = pandas.read_excel(datafile,sheetname='data')
   
    fig = plt.figure(dpi=300)
    ax1 = fig.add_subplot(111)
    #ax2 = ax1.twiny()
    Xbottom =  data['mem_pb'].values*2
    #data_array[:,1:end]=  data_array[:,1:end] 
  
    #line0, = ax1.plot(Xbottom,data[' 72w'].values ,'k->',ms=10,mfc='k',lw =2)
    #line1, = ax1.plot(Xbottom,data[' 80w'].values ,'r--o',ms=10,mfc='r',lw =2)
    #line2, = ax1.plot(Xbottom,data['100w'].values ,'g-.p',ms=10,mfc='g',lw =2)
    #line3, = ax1.plot(Xbottom,data['120w'].values ,'b-*',ms=10,mfc='b',lw =2)
    #line4, = ax1.plot(Xbottom,data['140w'].values ,'c--^',ms=10,mfc='c',lw =2)
    #line5, = ax1.plot(Xbottom,data['160w'].values ,'m-.h',ms=10,mfc='m',lw =2)
    #line6, = ax1.plot(Xbottom,data['180w'].values ,'y-d',ms=10,mfc='y',lw =2)
    #line7, = ax1.plot(Xbottom,data['200w'].values ,'r--<',ms=10,mfc='r',lw =2) 


    line1, = ax1.plot(Xbottom,data['72'].values ,'k->',ms=10,mfc='k',lw =2,label='72w')
    line2, = ax1.plot(Xbottom,data['80'].values ,'r--o',ms=10,mfc='r',lw =2,label='80w')
    line3, = ax1.plot(Xbottom,data['88'].values ,'c-h',ms=10,mfc='c',lw =2,label='88w')
    line4, = ax1.plot(Xbottom,data['100'].values ,'g-.p',ms=10,mfc='g',lw =2,label='100w')
    line5, = ax1.plot(Xbottom,data['116'].values ,'m--<',ms=10,mfc='m',lw =2,label='116w')
    line6, = ax1.plot(Xbottom,data['120'].values ,'b-*',ms=10,mfc='b',lw =2,label='120w')
    line7, = ax1.plot(Xbottom,data['128'].values ,c=(0.9412,0.4706,0),ls='-.',marker='h',ms=10,mfc=(0.9412,0.4706,0),lw =2,label='128w')
    line8, = ax1.plot(Xbottom,data['136'].values ,c=(0.251,0,0.502),ls='--',marker='p',ms=10,mfc=(0.251,0,0.502),lw =2,label='136w')
    line9, = ax1.plot(Xbottom,data['148'].values ,c=(0.502,0.251,0),ls='-',marker='^',ms=10,mfc=(0.502,0.251,0),lw =2,label='148w')
    line10, = ax1.plot(Xbottom,data['156'].values ,c=(0,0.502,0.502),ls='-.',marker='o',ms=10,mfc=(0,0.502,0.502),lw =2,label='156w')
    line11, = ax1.plot(Xbottom,data['176'].values ,c=(1,0.502,0.502),ls='--',marker='v',ms=10,mfc=(0.502,0,0),lw =2,label='176w')
    line12, = ax1.plot(Xbottom,data['180'].values ,'y-d',ms=10,mfc='y',lw =2,label='186w')
   # line8, = ax1.plot(Xbottom,data_array[:,8] ,color='pink',linestyle='-',ms,ms=10,mfc='pink',lw =2)

#    line9, = ax1.plot(Xbottom,data_array[:,9] ,'r-o',ms=10,mfc='r',lw =2)
#    line10, = ax1.plot(Xbottom,data_array[:,10] ,'g-->',ms=10,mfc='g',lw =2)
#    line11, = ax1.plot(Xbottom,data_array[:,11] ,'b-o',ms=10,mfc='b',lw =2)
#    line12, = ax1.plot(Xbottom,data_array[:,12] ,'c-->',ms=10,mfc='c',lw =2)
#    line13, = ax1.plot(Xbottom,data_array[:,13] ,'m-o',ms=10,mfc='m',lw =2)

#    #line14, = ax1.plot(Xbottom,data_array[:,14] ,'y-->',ms=10,mfc='y',lw =2)
    
#    line15, = ax1.plot(Xbottom,data_array[:,15] ,'k-o',ms=10,mfc='k',lw =2)
#    line16, = ax1.plot(Xbottom,data_array[:,16] ,color='pink',linestyle='--',ms=10,mfc='pink',lw =2)
    ax1.set_xlabel(r"$P_{mem}$ (Watts)", size=20)
    ax1.set_ylabel("Performance (Average GUP/s)", size=20)  
    xtickStart =  0
    xtickEnd = 160
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both', length=8, width=2,pad =12, labelsize=18)
    #ax1.tick_params(axis = 'both', which = 'minor', labelsize = 0)

    numYtick=5
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data['180'].values)/3/numYtick)*3*numYtick 
    ax1.set_ylim([0,ytickEnd])       
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
    ax1.set_yticks(yticksMajor)
    ax1.grid(True,which='major',linestyle='--')
    ax1.legend([line1,line2,line3,line4,line5,line6,line7,line8,
                line9,line10,line11,line12],['72w','80w','88w','100w','116w','120w','128w','136w','148w','156w','176w','180w'],title=r'$\mathbf{P_{ub}}$',prop={'size':16},loc=0)
#                ['80w','88w','96w','100w','108w','116w','120w','128w','136w',
#            '140w','148w','156w','160w','168w','176w','180w'],prop={'size':18})
    ax1.get_legend().get_title().set_fontsize(30)
#    #ax2.set_xlim(ax1.get_xlim())
#    #ax2.set_xticks(xticksMajor)
#    #ax2.set_xticklabels(int(power)-xticksMajor)
#    #ax2.set_xlabel(r"Power Bound on PKG Modules (Watts)") 
#    #ax2.tick_params(length=8, width=2,pad =8)
#    #ax2.tick_params(axis='x',pad=8)

    fig.tight_layout()
    ax1.set_title("Performance Profiles of star Random Access" ,fontsize = 24, fontweight='bold',y=1.06)
    fig.subplots_adjust(top=0.85)
    font = {'family' : 'sans-serif','sans-serif':['Helvetica'],
            'weight' : 'bold',
            'size'   : 16}

    matplotlib.rc('font', **font)
    
    fig.set_size_inches(12,9)
    fig.savefig(os.path.join(pathfolder,'rdAccess_Kilo.jpg'),bbox_inches='tight')  
def DrawPower(pathfolder):

    datafile = os.path.join(pathfolder,'Power.xlsx')    
    data = pandas.read_excel(datafile,parse_cols='A:M',sheetname='Power')
   
    fig = plt.figure(dpi=600)
    ax1 = fig.add_subplot(111)
    #ax2 = ax1.twiny()
    Xbottom =  data['ram'].values*2
    #data_array[:,1:end]=  data_array[:,1:end] 
 
    line1, = ax1.plot(Xbottom,data[' 72w'].values ,'r-->',ms=10,mfc='r',lw =2,label='72w')
    line2, = ax1.plot(Xbottom,data[' 80w'].values ,'g-o',ms=10,mfc='g',lw =2,label='80w')
    line3, = ax1.plot(Xbottom,data[' 88w'].values ,'b-->',ms=10,mfc='b',lw =2,label='88w')
    line4, = ax1.plot(Xbottom,data['100w'].values ,'c-o',ms=10,mfc='c',lw =2,label='100w')
    line5, = ax1.plot(Xbottom,data['116w'].values ,'m-->',ms=10,mfc='m',lw =2,label='116w')
    line6, = ax1.plot(Xbottom,data['120w'].values ,'y-o',ms=10,mfc='y',lw =2,label='120w')
    line7, = ax1.plot(Xbottom,data['128w'].values ,'k-->',ms=10,mfc='k',lw =2,label='128w')
    line8, = ax1.plot(Xbottom,data['136w'].values ,'r-o',ms=10,mfc='r',lw =2,label='136w')
    line9, = ax1.plot(Xbottom,data['148w'].values ,'g-->',ms=10,mfc='g',lw =2,label='148w')
    line10, = ax1.plot(Xbottom,data['156w'].values ,'b-o',ms=10,mfc='b',lw =2,label='156w')
    line11, = ax1.plot(Xbottom,data['176w'].values ,'c-->',ms=10,mfc='c',lw =2,label='176w')
    line12, = ax1.plot(Xbottom,data['180w'].values ,'m-o',ms=10,mfc='m',lw =2,label='186w')
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
    ax1.set_ylabel("Actual Power (Watts)")  
    xtickStart =  0
    xtickEnd = math.ceil(max(Xbottom)/10)*10
    xtickStep = 20
    xticksMajor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    ax1.set_xticks(xticksMajor)  
    ax1.set_xlim(xtickStart, xtickEnd)
    #xtickStep = 10
    #xticksMinor = numpy.arange(xtickStart,xtickEnd+1,xtickStep)
    #ax1.set_xticks(xticksMajor, minor=True)  
    ax1.tick_params(axis = 'both', length=8, width=2,pad =12)
    #ax1.tick_params(axis = 'both', which = 'minor', labelsize = 0)

    numYtick=6
    #ytickStart = math.floor(min(data_array[:,1] /4 ))*4
    ytickStart=0
    ytickEnd = math.ceil(max(data['180w'].values*1.1)/10/numYtick)*10*numYtick
    ytickEnd=180 
    ax1.set_ylim([0,ytickEnd])       
    yticksMajor = numpy.linspace(ytickStart,ytickEnd,numYtick+1)
    ax1.set_yticks(yticksMajor)
    ax1.grid(True,which='major',linestyle='--')
    ax1.legend([line1,line2,line3,line4,line5,line6,line7,line8,
                line9,line10,line11,line12],['72w','80w','88w','100w','116w','120w','128w','136w','148w','156w','176w','180w'],title=r'$\mathbf{P_{ub}}$',prop={'size':22})
#                ['80w','88w','96w','100w','108w','116w','120w','128w','136w',
#            '140w','148w','156w','160w','168w','176w','180w'],prop={'size':18})
    ax1.get_legend().get_title().set_fontsize(22)
#    #ax2.set_xlim(ax1.get_xlim())
#    #ax2.set_xticks(xticksMajor)
#    #ax2.set_xticklabels(int(power)-xticksMajor)
#    #ax2.set_xlabel(r"Power Bound on PKG Modules (Watts)") 
#    #ax2.tick_params(length=8, width=2,pad =8)
#    #ax2.tick_params(axis='x',pad=8)

    fig.tight_layout()
    ax1.set_title("Power Profiles of star RandomAccess" ,fontsize = 32, fontweight='bold',y=1.06)
    fig.subplots_adjust(top=0.85)
    font = {'family' : 'sans-serif','sans-serif':['Helvetica'],
            'weight' : 'bold',
            'size'   : 30}

    matplotlib.rc('font', **font)
    
    fig.set_size_inches(16,12)
    fig.savefig(os.path.join(pathfolder,'rdAccess_power.jpg'),bbox_inches='tight')


if __name__ == "__main__":
    pathfolder = r"C:\Users\Pengf\Documents\Linux_Doc\PowerBound\CCPC\results\SRA"
    #read2( pathfolder)
    DrawKilo(pathfolder)