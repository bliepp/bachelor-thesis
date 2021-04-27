#!/usr/bin/gnuplot

#SETUP AREA
reset
set encoding utf8
set decimalsign ','

set samples 2000

set key top right spacing 2
set grid

set xrange [-5:5]
set yrange [0:0.165]

set xlabel "x"
set ylabel "Normierte Gauss-Funktion G(x)"


#FUNC AREA
g(x, sigma) = 1/(2*sigma*sigma*3.142) * exp(-x*x /(2*sigma*sigma))


#OUTPUT AREA
#set term pdf enhanced color font "Helvetica,14" size 16,9
#set out "daten.pdf"
set term postscript eps enhanced color font "Helvetica,20"
set out "gauss.eps"


#PLOT AREA
plot g(x, 1) title "{/Symbol s} = 1.0" lt rgb "black",\
	g(x, 1.5) title "{/Symbol s} = 1.5" dt "- " lt rgb "black"
#	g(x, 0.95) title "{/Symbol s} = 0.9" dt "- . " lt rgb "black"

