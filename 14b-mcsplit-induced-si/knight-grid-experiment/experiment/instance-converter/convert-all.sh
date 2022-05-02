mkdir -p double-edged-lad-graphs

for f in lad-graphs/*; do
    echo $f
    python instance-converter/convert.py < $f > double-edged-$f
done
