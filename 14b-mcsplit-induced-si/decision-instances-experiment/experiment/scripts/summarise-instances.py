#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(famcol)!=1?NaN:clamp(xcol)):(clamp(ycol)) ls 1 pt 1 ps 0.7 ti 'SF', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:(column(famcol)!=2&&column(famcol)!=11)?NaN:clamp(xcol)):(clamp(ycol)) w p ls 2 pt 2 ps 0.7 ti 'LV', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:(column(famcol)!=3&&column(famcol)!=4)?NaN:clamp(xcol)):(clamp(ycol)) ls 3 pt 3 ps 0.7 ti 'BVG(r)', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:(column(famcol)!=5&&column(famcol)!=6)?NaN:clamp(xcol)):(clamp(ycol)) ls 4 pt 4 ps 0.7 ti 'M4D(r)', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(famcol)!=7?NaN:clamp(xcol)):(clamp(ycol)) ls 5 pt 10 ps 0.7 ti 'Rand', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(famcol)!=9?NaN:clamp(xcol)):(clamp(ycol)) ls 6 pt 6 ps 0.7 ti 'PR', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(famcol)!=12?NaN:clamp(xcol)):(clamp(ycol)) ls 7 pt 8 ps 0.7 ti 'Phase', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(famcol)!=13?NaN:clamp(xcol)):(clamp(ycol)) ls 13 pt 14 ps 0.7 ti 'Meshes', \
#     plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(famcol)!=14?NaN:clamp(xcol)):(clamp(ycol)) ls 8 pt 12 ps 0.7 ti 'Images', \

family_num_to_name = {
    1: "Scalefree",
    2: "LV",
    11: "LV",
    3: "BVG",
    4: "BVG",
    5: "M4D",
    6: "M4D",
    7: "Rand",
    9: "PR",
    12: "Phase",
    13: "Meshes",
    14: "Images"
}

families = ["Scalefree", "LV", "BVG", "M4D", "Rand", "PR", "Phase", "Meshes", "Images"]

family_to_values = {}

for family_name in families:
    family_to_values[family_name] = {
        "pn": [],
        "pd": [],
        "tn": [],
        "td": []
    }


with open("fatanode-results/densities-with-families.txt", "r") as f:
    for i, line in enumerate(f):
        if i == 0:
            continue
        line = line.strip().split()
        pn = int(line[1])
        pd = float(line[2])
        tn = int(line[3])
        td = float(line[4])
        family_num = int(line[5])
        family_name = family_num_to_name[family_num]
        family_to_values[family_name]["pn"].append(pn)
        family_to_values[family_name]["pd"].append(pd)
        family_to_values[family_name]["tn"].append(tn)
        family_to_values[family_name]["td"].append(td)

for family in families:
    print("\\rule{{0pt}}{{2.3ex}}{} & {} & {} & {} & {:.4f} & {:.4f} & {} & {} & {:.4f} & {:.4f} \\\\".format(
            family,
            len(family_to_values[family]["pn"]),
            min(family_to_values[family]["pn"]),
            max(family_to_values[family]["pn"]),
            min(family_to_values[family]["pd"]),
            max(family_to_values[family]["pd"]),
            min(family_to_values[family]["tn"]),
            max(family_to_values[family]["tn"]),
            min(family_to_values[family]["td"]),
            max(family_to_values[family]["td"])))



