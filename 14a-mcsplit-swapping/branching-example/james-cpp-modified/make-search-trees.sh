./mcsp -d -y min_max g.grf i5.grf | grep NODE > tree_gi_b_and_b.txt
./mcsp -d -y min_max i5.grf g.grf | grep NODE > tree_ig_b_and_b.txt

./mcsp -d -y min_max g.grf h.grf | grep NODE > tree_gh_b_and_b.txt
./mcsp -d -y min_max h.grf g.grf | grep NODE > tree_hg_b_and_b.txt
./mcsp -b -d -y min_max g.grf h.grf | grep NODE > tree_gh.txt
./mcsp -b -d -y min_max h.grf g.grf | grep NODE > tree_hg.txt

python3 make-latex-forest.py --highlight-last-subtree --b-and-b < tree_gh_b_and_b.txt > treegh-b-and-b-highlighted.tex
python3 make-latex-forest.py --highlight-last-subtree --b-and-b --letters-first < tree_hg_b_and_b.txt > treehg-b-and-b-highlighted.tex
python3 make-latex-forest.py --b-and-b < tree_gh_b_and_b.txt > treegh-b-and-b.tex
python3 make-latex-forest.py --b-and-b --letters-first < tree_hg_b_and_b.txt > treehg-b-and-b.tex
python3 make-latex-forest.py --highlight-last-subtree < tree_gh.txt > treegh.tex
python3 make-latex-forest.py --highlight-last-subtree --letters-first < tree_hg.txt > treehg.tex

python3 make-latex-forest.py --b-and-b --compact < tree_gi_b_and_b.txt > treegi-b-and-b.tex
python3 make-latex-forest.py --b-and-b --letters-first --compact < tree_ig_b_and_b.txt > treeig-b-and-b.tex
