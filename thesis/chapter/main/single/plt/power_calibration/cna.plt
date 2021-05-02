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

set xlabel "Zeit t"
set ylabel "Geschmolzener Anteil [%]"


#OUTPUT AREA
set term postscript eps enhanced color font "Helvetica,22"
set out "cna.eps"


# VALUES AND CONSTANTS
frame_factor = 5
chkpt_factor = 500
steps_factor = 0.1
factor = frame_factor*chkpt_factor*steps_factor

power = "60 80 100 160"
color = "red green blue orange"

vel5 = "vel5_power"
vel10 = "vel10_power"

# FUNCTIONS
linear(x, m, b) = m*x + b
relative(val, ref) = 100.0*val/(val+ref)

FILE(prefix, index) = sprintf("%s%s.cna", prefix, word(power, index))
LABEL(index) = sprintf("P = %s", word(power, index))
COLOR(index) = word(color, index)


# GLOBAL PLOT SETTINGS
set arrow from 350, graph 0 to 350, graph 1 nohead lt rgb "grey"


# SMALL SCALE
set fit logfile "cna.smallscale.fit.log"
fit [900:4000] c60 FILE(vel10,1) u ($1*factor):(relative($2,$3)) via c60
fit [900:4000] c80 FILE(vel10,2) u ($1*factor):(relative($2,$3)) via c80
fit [900:3000] c100 FILE(vel10,3) u ($1*factor):(relative($2,$3)) via c100
fit [900:1500] c160 FILE(vel10,4) u ($1*factor):(relative($2,$3)) via c160

set xrange [0:5000]
set yrange [0:105]
plot for [i=1:words(power)]\
	FILE(vel10,i) u ($1*factor):(relative($2,$3)) w lp title LABEL(i) lt rgb COLOR(i) pt 1,\
	c60 notitle lt rgb COLOR(1) dt "- ",\
	c80 notitle lt rgb COLOR(2) dt "- ",\
	c100 notitle lt rgb COLOR(3) dt "- ",\
	c160 notitle lt rgb COLOR(4) dt "- "


# BIG SCALE
set fit logfile "cna.bigscale.fit.log"
fit [7000:19000] linear(x, m60, b60) FILE(vel10,1) u ($1*factor):(relative($2,$3)) via m60,b60
fit [6000:20000] linear(x, m80, b80) FILE(vel10,2) u ($1*factor):(relative($2,$3)) via m80,b80
fit [4000:10000] linear(x, m100, b100) FILE(vel10,3) u ($1*factor):(relative($2,$3)) via m100,b100
fit [1500:3000] linear(x, m160, b160) FILE(vel10,4) u ($1*factor):(relative($2,$3)) via m160,b160

set xrange [0:21500]
#set yrange [60:105]
plot for [i=1:words(power)]\
	FILE(vel10,i) u ($1*factor):(relative($2,$3)) w lp title LABEL(i) lt rgb COLOR(i) pi 3 pt 1,\
	linear(x, m60, b60) notitle lt rgb COLOR(1) dt "- ",\
	linear(x, m80, b80) notitle lt rgb COLOR(2) dt "- ",\
	linear(x, m100, b100) notitle lt rgb COLOR(3) dt "- "#,\
	#linear(x, m160, b160) notitle lt rgb COLOR(4) dt "- "


# KORRIGIERT, questionable
#set ylabel "Korrigierter geschmolzener Anteil [%]"
#unset yrange
#plot FILE(vel10,1) u ($1*factor):( relative($2,$3) - m60*$1*factor )\
#		w lp title "P = 60.0" lt rgb COLOR(1) pi 3 pt 1,\
#	FILE(vel10,2) u ($1*factor):( relative($2,$3) - m80*$1*factor )\
#		w lp title "P = 80.0" lt rgb COLOR(2) pi 3 pt 1,\
#	FILE(vel10,3) u ($1*factor):( relative($2,$3) - m100*$1*factor )\
#		w lp title "P = 100.0" lt rgb COLOR(3) pi 3 pt 1,\
