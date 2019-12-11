#!/bin/bash

ZP=zeropoint.sh.odc.im
DS=deathstar.sh.odc.im

mkdir -p ~/mecha
cd ~/mecha
rsync -avz --copy-links $ZP:/usr/local/railsapps/harmony/mecha .
rsync -avz mecha $DS:/usr/local/railsapps/harmony --rsync-path="sudo rsync" --chmod=ugo=rX
