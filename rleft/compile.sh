#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

openscad -o rleft.stl rleft.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 1 \
	 --solid-layers 1 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 180,70 \
	 --skirts 3 \
	 --fill-density 0.05 \
	 -o rleft.gcode rleft.stl

sed -i 's/M104 S200/M104 S220/' rleft.gcode
sed -i 's/M109 S200/M109 S220/' rleft.gcode
