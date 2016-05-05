#いままでの設定をすべてクリアする
reset
#x, y の軸ラベルを設定する
set xlabel 'xlabel'
set ylabel 'ylabel'

#eps ファイルとして書き出し
set terminal postscript enhanced eps color
set output 'outputFileName.eps'

#グラフを描画
plot 'fileName.txt' using 1:2 title "title"

#出力を標準に戻す
set terminal windows
set output