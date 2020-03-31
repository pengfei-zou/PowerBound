#!/bin/bash


FRIST=$(qsub  bt-mz.C.8.qsub)
echo $FRIST
SECOND=$(qsub -W depend=afterany:$FRIST sp-mz.C.8.qsub)
echo $SECOND
THIRD=$(qsub -W depend=afterany:$SECOND lu-mz.C.8.qsub)
echo $THIRD
FOURTH=$(qsub -W depend=afterany:$THIRD CoMD.qsub)
echo $FOURTH
FIFTH=$(qsub -W depend=afterany:$FOURTH CloverLeaf-bm16.qsub)
echo $FIFTH
SIXTH=$(qsub -W depend=afterany:$FIFTH lulesh.qsub)
echo $SIXTH
SEVENTH=$(qsub -W depend=afterany:$SIXTH miniAero.qsub)
echo $SEVENTH
EIGHTH=$(qsub -W depend=afterany:$SEVENTH CloverLeaf-bm128.qsub)
echo $EIGHTH
NINTH=$(qsub -W depend=afterany:$EIGHTH TeaLeaf-bm5.qsub)
echo $NINTH
TENTH=$(qsub -W depend=afterany:$NINTH miniMD.qsub)
echo $TENTH
ELEVENTH=$(qsub -W depend=afterany:$TENTH TeaLeaf-bm20.qsub)
echo $ELEVENTH
TWELVTH=$(qsub -W depend=afterany:$ELEVENTH AMG.qsub)
echo $TWELVTH
# FRIST=$(qsub  ./balance/npb_8.pbs)
# echo $FRIST
# SECOND=$(qsub -W depend=afterany:$FRIST ./balance/npb_6.pbs)
# echo $SECOND
# THIRD=$(qsub -W depend=afterany:$SECOND ./balance/npb_4.pbs)
# echo $THIRD
# FOURTH=$(qsub -W depend=afterany:$THIRD ./balance/npb_2.pbs)
# echo $FOURTH
# FIFTH=$(qsub -W depend=afterany:$FOURTH ./balance/npb_1.pbs)
# echo $FIFTH
# SIXTH=$(qsub -W depend=afterany:$FIFTH ./unbalance/npb_8.pbs)
# echo $SIXTH
# SEVENTH=$(qsub -W depend=afterany:$SIXTH ./unbalance/npb_6.pbs)
# echo $SEVENTH
# EIGHTH=$(qsub -W depend=afterany:$SEVENTH ./unbalance/npb_4.pbs)
# echo $EIGHTH
# NINTH=$(qsub -W depend=afterany:$EIGHTH ./unbalance/npb_2.pbs)
# echo $NINTH
# TENTH=$(qsub -W depend=afterany:$NINTH ./unbalance/npb_1.pbs)
# echo $TENTH