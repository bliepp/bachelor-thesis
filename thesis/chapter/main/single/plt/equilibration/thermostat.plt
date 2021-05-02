#!/usr/bin/env gnuplot
#
#
#

reset
set encoding utf8
set decimalsign ','

set term postscript eps enhanced color font "Helvetica,22"
set out "thermostat.eps"


file = "equi_block_aufgeheizt.eng"


set key bottom right Left
set grid

set xrange [:1000]
#set yrange [:]

set xlabel "Zeit t"
set ylabel "Temperatur T [meV * k_B]"
plot file u 1:($3*1000) w d notitle lt rgb "red"


unset xrange
set yrange[-3.36:-3.32]
set ytics -3.36,0.01

set ylabel "Potentielle Energie E_{pot} [eV]"
plot file u 1:2 w d notitle lt rgb "red"


#FIT-WERTE
