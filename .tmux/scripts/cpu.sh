#!/bin/bash

 # to use top in script should be used in batch mode with -b flag instead of default interactive mode
 top -b -n 1 | awk -v cpu="CPU: " 'FNR == 3 { 
 	if(100 - $8 < 10 && $8 % 1 != 0) 
 		{print cpu " " 100 - $8"%"} 
 	else if(100 - $8 < 10 && $1 % 1 == 0)
 		{print cpu " "100-$8".0%"}
 	else if(100 - $8 >= 10 && $8+0 % 1 == 0) 
 		{print cpu 100-$8".0%"}
 	else 
 		{print cpu 100-$8"%"}
 	}'

# Test code to check if conditions
# echo 98 | awk '{ 
# 	if(100 - $1 < 10 && $1 % 1 != 0) 
# 		{print "HERE CPU:  "100-$1"%"} 
# 	else if(100 - $1 < 10 && $1 % 1 == 0)
# 		{print "less 10 no dec: " 100 - $1".0%"}
# 	else if(100 - $1 >= 10 && $1 % 1 == 0) 
# 		{print "WTF!" 100 - $1 ".0%"}
# 	else 
# 		{print "LAST CPU: "100-$1"%"}
# 	}'
