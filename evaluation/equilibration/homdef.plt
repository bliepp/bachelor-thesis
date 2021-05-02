#!/usr/bin/env gnuplot
#
#
#

reset
set encoding iso_8859_1
set decimalsign ','

set term postscript eps enhanced color font "Helvetica,22"
set out "homdef.eps"


file = "equi_block.eng"


set fit logfile "homdef.fit.log"
f(x) = a*x*x + b*x + c
fit [15:17] f(x) file u 5:2 via a, b, c


set y2tics -0.1,0.1 # pressure
set ytics -3.35,0.1 nomirror # pot. energy

set xlabel "Volumen pro Atom V [{\305}^3]"
set ylabel "Potentielle Energie pro Atom [eV]"
set y2label "Druck P [ev \305}^{-3}]" rotate by -90

set xrange[12.5:21.5]
set yrange[-3.38:-3.02]
set y2range[-0.13:0.23]

zero_crossing = word(system("./find_zero.py"), 5)
set arrow from graph 0, second 0 to graph 1, second 0 nohead lt rgb "grey"
set arrow from zero_crossing, graph 0 to zero_crossing, graph 1 nohead lt rgb "grey"

plot file u 5:2 w l title "E_{pot}" axis x1y1 lt rgb "red",\
	file u 5:4 w l title "P" axis x1y2 lt rgb "blue"
	#[13.388:19.388] f(x) notitle axis x1y1 lt rgb "red" dt "- ",\
#plot file u 1:5 w l title "Zeit-Volumen"
#plot file u 1:2 w l title "Zeit-Energie"
