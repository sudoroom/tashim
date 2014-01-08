#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

openscad -o center.stl center.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 2 \
	 --solid-layers 3 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 190,60 \
	 --skirts 3 \
	 --fill-density 0.12 \
	 -o center.gcode center.stl

sed -i 's/M104 S200/M104 S220/' center.gcode
sed -i 's/M109 S200/M109 S220/' center.gcode
