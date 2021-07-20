#!/usr/bin/env gnuplot
#
# Schematic plot of the LJ potential
#

#SETUP AREA
reset
set encoding utf8
set decimalsign ','

set key top right spacing 2
set grid

set xrange [0.85:2.75]
set yrange [-1.5:5]

set xlabel "Distance r [{/Symbol s}]"
set ylabel "Potential U [{/Symbol e}]"


#FUNC AREA
f(x) = (1/x)**6
U(x) = 4*(f(x)**2 - f(x))


#OUTPUT AREA
#set term pdf enhanced color font "Helvetica,14" size 16,9
#set out "daten.pdf"
set term postscript eps enhanced color font "Helvetica,20"
set out "lennard_jones_en.eps"


#PLOT AREA
plot U(x) title "Lennard-Jones potential" lt rgb "black",\
	-4*f(x) title "-4 (1/r)^{6}" dt "- " lt rgb "black",\
	4*f(x)**2 title "4 (1/r)^{12}" dt "- . " lt rgb "black"

