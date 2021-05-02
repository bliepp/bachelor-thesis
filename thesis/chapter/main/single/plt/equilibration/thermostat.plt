#!/usr/bin/env gnuplot
#
#
#

reset
set encoding utf8
set decimalsign ','
set samples 2000

set term postscript eps enhanced color font "Helvetica,22"
file = "equi_block_aufgeheizt.eng"


set key bottom right Left
set grid


soll(x) = x < 500 ? 0.05*x : 25


set out "thermostat.eps"
set xrange [:1000]
#set yrange [:]

set xlabel "Zeit t"
set ylabel "Temperatur T [meV * k_B]"
plot soll(x) title "Sollkurve" lw 5 lt rgb "red",\
	file u 1:($3*1000) w d notitle lt rgb "black"


set out "thermostat_pot.eps"
unset xrange
set yrange[-3.36:-3.32]
set ytics -3.36,0.01

set ylabel "Potentielle Energie E_{pot} [eV]"
plot file u 1:2 w d notitle lt rgb "black"


#FIT-WERTE
