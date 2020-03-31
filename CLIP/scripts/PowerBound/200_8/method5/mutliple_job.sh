#!/bin/bash



SECOND=$(qsub sp-mz.C.8.qsub)
echo $SECOND
SEVENTH=$(qsub -W depend=afterany:$SECOND miniAero.qsub)
echo $SEVENTH
NINTH=$(qsub -W depend=afterany:$SEVENTH TeaLeaf-bm5.qsub)
echo $NINTH
ELEVENTH=$(qsub -W depend=afterany:$NINTH TeaLeaf-bm20.qsub)
echo $ELEVENTH

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