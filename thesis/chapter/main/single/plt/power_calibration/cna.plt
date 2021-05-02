#!/usr/bin/env gnuplot
#
# Results of Common Neighbor Analysis:
# Type OTHER represents approx. molten particles
#

#SETUP AREA
reset
set encoding utf8
set decimalsign ','

set key bottom right Left
set grid

set xlabel "Simulationsschritte"
set ylabel "Geschmolzener Anteil [%]"


#OUTPUT AREA
set term postscript eps enhanced color font "Helvetica,22"
set out "cna.eps"


# VALUES AND CONSTANTS
frame_factor = 5
chkpt_factor = 500
steps_factor = 0.1
factor = frame_factor*chkpt_factor#*steps_factor

power = "60 80 100 160"
color = "red green blue orange"

# FUNCTIONS
linear(x, m, b) = m*x + b
relative(val, ref) = 100.0*val/(val+ref)

FILE(index) = sprintf("vel10_power%s.cna", word(power, index))
LABEL(index) = sprintf("P = %s", word(power, index))
COLOR(index) = word(color, index)


# GLOBAL PLOT SETTINGS
set arrow from 3500, graph 0 to 3500, graph 1 nohead lt rgb "grey"


# SMALL SCALE
set fit logfile "cna.smallscale.fit.log"
fit [9000:40000] c60 FILE(1) u ($1*factor):(relative($2,$3)) via c60
fit [9000:40000] c80 FILE(2) u ($1*factor):(relative($2,$3)) via c80
fit [9000:30000] c100 FILE(3) u ($1*factor):(relative($2,$3)) via c100
fit [9000:15000] c160 FILE(4) u ($1*factor):(relative($2,$3)) via c160

set xrange [0:50000]
set yrange [0:105]
plot for [i=1:words(power)]\
	FILE(i) u ($1*factor):(relative($2,$3)) w lp title LABEL(i) lt rgb COLOR(i),\
	c60 notitle lt rgb COLOR(1) dt "- ",\
	c80 notitle lt rgb COLOR(2) dt "- ",\
	c100 notitle lt rgb COLOR(3) dt "- ",\
	c160 notitle lt rgb COLOR(4) dt "- "


# BIG SCALE
set fit logfile "cna.bigscale.fit.log"
fit [70000:190000] linear(x, m60, b60) FILE(1) u ($1*factor):(relative($2,$3)) via m60,b60
fit [60000:200000] linear(x, m80, b80) FILE(2) u ($1*factor):(relative($2,$3)) via m80,b80
fit [40000:150000] linear(x, m100, b100) FILE(3) u ($1*factor):(relative($2,$3)) via m100,b100
fit [15000:30000] linear(x, m160, b160) FILE(4) u ($1*factor):(relative($2,$3)) via m160,b160

set xrange [0:215000]
set yrange [60:105]
plot for [i=1:words(power)]\
	FILE(i) u ($1*factor):(relative($2,$3)) w lp title LABEL(i) lt rgb COLOR(i) pi 3 pt 1,\
	linear(x, m60, b60) notitle lt rgb COLOR(1) dt "- ",\
	linear(x, m80, b80) notitle lt rgb COLOR(2) dt "- ",\
	linear(x, m100, b100) notitle lt rgb COLOR(3) dt "- "#,\
	#linear(x, m160, b160) notitle lt rgb COLOR(4) dt "- "


# KORRIGIERT, questionable
#set ylabel "Korrigierter geschmolzener Anteil [%]"
#unset yrange
#plot FILE(1) u ($1*factor):( relative($2,$3) - m60*$1*factor )\
#		w lp title "P = 60.0" lt rgb COLOR(1) pi 3 pt 1,\
#	FILE(2) u ($1*factor):( relative($2,$3) - m80*$1*factor )\
#		w lp title "P = 80.0" lt rgb COLOR(2) pi 3 pt 1,\
#	FILE(3) u ($1*factor):( relative($2,$3) - m100*$1*factor )\
#		w lp title "P = 100.0" lt rgb COLOR(3) pi 3 pt 1,\
