set terminal png transparent size 640,240
set size 1.0,1.0

set terminal png transparent size 640,480
set output 'commits_by_author.png'
set key left top
set yrange [0:]
set xdata time
set timefmt "%s"
set format x "%Y-%m-%d"
set grid y
set ylabel "Commits"
set xtics rotate
set bmargin 6
plot 'commits_by_author.dat' using 1:2 title "huangchuanlin" w lines, 'commits_by_author.dat' using 1:3 title "shroom" w lines, 'commits_by_author.dat' using 1:4 title "longfeixiang" w lines, 'commits_by_author.dat' using 1:5 title "Liu Andong" w lines, 'commits_by_author.dat' using 1:6 title "TianZeRong" w lines, 'commits_by_author.dat' using 1:7 title "FXHOLL3C3WS9BX0\Administrator" w lines, 'commits_by_author.dat' using 1:8 title "mayuefeng" w lines, 'commits_by_author.dat' using 1:9 title "chenguanli" w lines, 'commits_by_author.dat' using 1:10 title "HuangQihan" w lines, 'commits_by_author.dat' using 1:11 title "liuandong" w lines, 'commits_by_author.dat' using 1:12 title "龙飞翔" w lines, 'commits_by_author.dat' using 1:13 title "wangjiahui" w lines, 'commits_by_author.dat' using 1:14 title "rongrong" w lines
