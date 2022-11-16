## DONE

- The  candidate  should  investigate  the  related  work  by  Jefferson  et  al  using  a  related  approach  for computational group theory.  _I have added a citation to Jefferson et al. in section 2.5 (page 12. I watched the video of Jefferson's CP 2021 talk on computational group theory and skimmed a few papers. This work is complex and I definitely don't understand all the details, but I am reasonably sure that it is far enough from McSplit that there isn't a need for a detailed discussion of the topic in my thesis._

- The candidate should expand the description of the Glasgow Subgraph Solver, in particular making clear the role and use of supplementary graphs.  _I have added more detail in section 2.7.1 (pages 20 and 21)._

- Check to make sure that where possible you link or cite sources of benchmark instances (apologies if this is already done everywhere) _Checked, and no amendments needed. Sections 3.5, 5.8.2, 5.8.3 and 5.8.4._

- Title page: don’t forget to update month and year _Done_

- There are quite a few blank pages between sections – is this a typesetting problem?  Fix if it is easy to do so
_I was using the LaTeX option ``twoside'', which seems to leave blank pages after some chapters. I've switched to ``oneside''._

- Beginning of 2.2: “two element subset” --> ‘two element subsets’ _Done_

- Page 9: “are mutually adjacent” consider “are pairwise adjacent”, I believe this is more standard _Done_

- Page  9:  consider  emphasising  that  labels  may  be  shared  between  vertices  if  this  is  so  (in  some  areas labeled graphs mean graphs in which each node has a unique label) _Done_

- Page 9: consider adding a citation for the properties of E-R graphs _Done_

- Section 2.4: here you use ‘unsatisfiable’ as a synonym for a “No” instance of a problem –consider defining this earlier, as non-CP folk could read this
_I have added a definition of a satisfiable (in passing) in the second paragraph of 1.3._

- Page 13:  ‘strongly connected graphs’ -it appears the graph in question is not directed, and usually this term  is  used  for  directed  graphs.    Clarify  either  that  the  graph  is  directed  or  what  strongly  connected means here
_This was an error. I have deleted "strongly"_

- Page 39: consider clarifying or reminding what ‘incumbent’ means –is this similar to a best-so-far notion? _Done (page 38 in new version)_

- Page 43, Theorem 1 (and surrounding text) please consider changing the notation here as discussed in the viva to avoid the second use of G, H, and to make clear that they are vertex sets in the description of P.  Please also consider adding both plan-language intuition for what P is, as well as an example.  _Done_

- Figure 3.6: please remind readers that the grey bands represent time-outs _I have added a reminder in the body of Section 3.6._

- Page 51: please clarify what is meant by ‘unconnected’ in the description of k-down. _This sentence was very unclear, so I have re-worded it. (Now on page 50)._

- Page 61: (bottom of this page) make sure you define the symbol that is composed of two orthogonal lines. 
_Checked. This is defined in section 2.8.2 ("a special value indicating that a vertex is unmapped."), with a reminder on page 60._

- Page 64:  when  mentioning  an  instance in  which labels  are  all distinct:  clarify  what  is  meant  here.    If  all labels are distinct and the labels must match, then isn't the problem instance straightforward?
_I have clarified the text, and added a footnote to show that MCIS remains NP-hard under this restriction._

- Page 72: “the plot use” --> ‘the plots use’ _Done_

- Page 109: clarify what is meant by ‘words’ of additional space _re-worded to avoid the word "words" - now on page 101 (previously  on page 104, I think?)_

- Page 108:  please confirm: the larger nodes in the figure are just to contain the larger labels and have no other meaning?
_Yes. I've tidied up the figure to make the circle sizes similar._

- Sometime  after  page  60:  consider  adding  a  table  that  summarises  the  results  in  terms  of when  to  use which approach. 
_I have added a paragraph to the conclusion of chapter 3 (and removed a sentence from the first paragraph of the same conclusion)._

- Consider commenting on the very-dense/very-sparse duality we discussed in the viva: will an approach for  an  induced  subgraph  problem  that  works  very  well  in  the dense  setting  also  work  very  well  in  the sparse setting by working in the complement? _I have added a paragraph on page 116 noting this (with an acknowledgement in a footnote)._

- On page 9, consider expanding the section on isomorphism and subgraph notions for directed graphs: e.g. must direction be preserved? _Done_

- Similarly on page 9, consider expanding on the adjacency matrix discussion for directed graphs _Done_

- In discussion of figure 2.5 -might be nice to include a proof that the solution in (b) is minimum _Done_

- For subgraph isomorphism especially, consider highlighting theresults on the harder instances (those that take, say, more than a second) and discuss why we might nevertheless still care about performance on the easier instances.
_I have added some brief discussion and results: (1) a paragraph after the discussion of table 5.8; (2) a discussion at the end of section 1.8.2.  The final paragraph of this discusses the need for harder benchmark instances._

## PARTIALLY DONE

- If possible, increase the font size in figures.
_I have slightly enlarged some of the figures with the smallest font sizes, such as 3.10-3.14 and most of the cumulative and scatter plots in chapter 5._

## NOT DONE

- (very optional) Page 44: carefully consider the proof here, and consider adding a more formal proof that the search trees are the same, perhaps including a bijection between nodes of the search trees.

## ADDITIONAL CHANGES NOT REQUESTED BY EXAMINERS

- Deleted "and Supergraph" from the thesis title

- Added section 2.9.3, which contains a link to the thesis repository.

