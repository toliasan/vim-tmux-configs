#!/bin/bash

free -h | awk -v ram="RAM: " -v total="[22Gb]" 'FNR == 2 {
	if($3 % 1 != 0) 
		{print ram $3+0"Gb " total}
	else 
		{print ram $3+0".0Gb " total}
}'
