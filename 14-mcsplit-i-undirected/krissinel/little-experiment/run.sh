rm -f instance_names.txt
rm -f *_times.txt

for i in $(seq 1 9); do
    for j in $(seq 1 9); do
        g=graphs/G$i.grf
        h=graphs/G$j.grf
        echo $g $h
        echo G$i-G$j >> instance_names.txt
        time ../mcsplit-modified/mcsp --dimacs --quiet min_max $g $h | grep -E 'CPU time|Count' >> mcsp_times.txt
        time ../mcsplit-modified2/mcsp --dimacs --quiet min_max $g $h | grep -E 'CPU time|Count' >> mcsp2_times.txt
        time ../../../../krissinel/csm-modified/mmdb2/a.out $g $h 0 | grep -E 'nMatches|time' >> csia_times.txt
    done
done

echo "McSplit run times (ms)"
cat mcsp_times.txt | awk -f make_table.awk

echo "Modified McSplit run times (ms)"
cat mcsp2_times.txt | awk -f make_table.awk

echo "CSIA run times (ms)"
cat csia_times.txt | awk -f make_table.awk

echo

paste instance_names.txt \
      <(cat mcsp_times.txt | awk '/CPU/ {print $4}') \
      <(cat mcsp2_times.txt | awk '/CPU/ {print $4}') \
      <(cat csia_times.txt | awk '/time:/ {print $2}') \
  | awk '{printf "%9s %7s %7s %7s\n", $1, $2, $3, $4}'

echo

paste instance_names.txt \
      <(cat mcsp_times.txt | awk '/Count/ {print $2}') \
      <(cat mcsp2_times.txt | awk '/Count/ {print $2}') \
      <(cat csia_times.txt | awk '/nMatches:/ {print $2}') \
  | awk '{printf "%9s %7s %7s %7s\n", $1, $2, $3, $4}'
