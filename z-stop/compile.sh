#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

openscad -o z-stop.stl z-stop.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 3 \
	 --bottom-solid-layers 3 \
	 --top-solid-layers 3 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 185,100 \
	 --skirts 3 \
	 -o z-stop.gcode z-stop.stl

sed -i 's/M104 S200/M104 S220/' z-stop.gcode
sed -i 's/M109 S200/M109 S220/' z-stop.gcode
