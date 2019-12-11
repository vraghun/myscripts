#!/bin/bash

for i in `cat raghuserver`
do
echo $i
ssh $i -l root
uname -r
done
