#!/bin/bash

for i in $@; do

	echo "$i"
done

shift 3

for j in $@; do

	echo "$j"
done
