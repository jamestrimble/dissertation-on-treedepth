mkdir -p table

echo '\documentclass[varwidth=true, border=3pt, convert={size=640x}]{standalone}' > table/table.tex
echo '\usepackage[T1]{fontenc}' >> table/table.tex
echo '\usepackage{textcomp}' >> table/table.tex
echo '\usepackage[utf8x]{inputenc}' >> table/table.tex
echo '\pagestyle{empty}' >> table/table.tex
echo '\usepackage{times,microtype,booktabs}' >> table/table.tex
echo '\begin{document}' >> table/table.tex
echo '\begin{table}' >> table/table.tex
echo '\begin{tabular}{rr}' >> table/table.tex
echo ' \toprule' >> table/table.tex
#echo '    Instance & A & B \\ [0.5ex]' >> table/table.tex
echo '    Solver A & Solver B \\ [0.5ex]' >> table/table.tex
echo ' \midrule' >> table/table.tex

cat data.txt | awk '
function num_or_timeout(t) {
    return t == 1000000 ? "timeout" : t;
}
NR > 1 {
#    print NR - 1, "&", $1, "&", $2, "\\\\"
    print num_or_timeout($1), "&", num_or_timeout($2), "\\\\"
}' >> table/table.tex

echo ' \bottomrule' >> table/table.tex
echo '\end{tabular}' >> table/table.tex
echo ' \vspace{1cm}' >> table/table.tex
echo '\end{table}' >> table/table.tex
echo '\end{document}' >> table/table.tex

cd table && latexmk -pdf table
