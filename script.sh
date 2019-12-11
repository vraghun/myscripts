#!/bin/bash
#N=`cat users|wc -l`
#i=0
cat users | while read line; 
do
#i=`expr $i + 1`
#echo $i
#echo $N
#if [ $i -le $N ]
#then
		for j in `cat slugs`
		do 
                  echo "username is $line and need access to this slug $j"
		done
#fi
done
