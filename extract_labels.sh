#cat debug_pivots.txt |  awk '{if ($1 != "_singletons_" && $1 != "_empty_") print $1,$2,$3,$5,$6}' > tmp_labels.txt
cat results/debug_pivots.txt |  awk '{if ($1 != "_singletons_" && $1 != "_empty_") print $3,$5,$6}' > data/tmp_labels.txt
cat data/map_labels.txt | awk '{print $1,$2}' > data/user_labels.txt
paste -d ' ' data/user_labels.txt data/tmp_labels.txt > data/labels.txt
cd src && python label_stats.py && cd ..
cat data/labels.txt | awk '{if (NF != 5) print $0}'


