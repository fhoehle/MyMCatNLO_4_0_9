#! /bin/bash
mainDir=$PWD
installDir=$mainDir/MCatNLO_4_0_9_Base
tarBallDir=$mainDir/mcatnlo_409_tarBall
if [ "X$1" == "X" ]; then 
  mkdir $tarBallDir
  cd $tarBallDir
  wget http://www.hep.phy.cam.ac.uk/theory/webber/MCatNLO/Package4.09_dist.tar.gz
  mkdir $installDir
  cd $installDir
  tar -xzf $tarBallDir/Package4.09_dist.tar.gz
  mv Package4.09_dist/* ./
  rm -rf Package4.09_dist
  patch -p1 < $mainDir/Package4.09_dist_cmssw53X.patch
  chmod u+x MCatNLO.inputs
  #chmod -R a-w $installDir
else if [  "X$1" == "Xclean" ]; then
  chmod -R u+w $installDir
  rm -rf $tarBallDir
  rm -rf $installDir
else
  echo "option $1 not supported"
  exit 1
fi
fi  
