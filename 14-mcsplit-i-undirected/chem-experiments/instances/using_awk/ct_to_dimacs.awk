BEGIN {
    atom_to_int["H"] = 1;
    atom_to_int["He"] = 2;
    atom_to_int["Li"] = 3;
    atom_to_int["Be"] = 4;
    atom_to_int["B"] = 5;
    atom_to_int["C"] = 6;
    atom_to_int["N"] = 7;
    atom_to_int["O"] = 8;
    atom_to_int["F"] = 9;
    atom_to_int["Ne"] = 10;
    atom_to_int["Na"] = 11;
    atom_to_int["Mg"] = 12;
    atom_to_int["Al"] = 13;
    atom_to_int["Si"] = 14;
    atom_to_int["P"] = 15;
    atom_to_int["S"] = 16;
    atom_to_int["Cl"] = 17;
    atom_to_int["Ar"] = 18;
    atom_to_int["K"] = 19;
    atom_to_int["Ca"] = 20;
    atom_to_int["Sc"] = 21;
    atom_to_int["Ti"] = 22;
    atom_to_int["V"] = 23;
    atom_to_int["Cr"] = 24;
    atom_to_int["Mn"] = 25;
    atom_to_int["Fe"] = 26;
    atom_to_int["Co"] = 27;
    atom_to_int["Ni"] = 28;
    atom_to_int["Cu"] = 29;
    atom_to_int["Zn"] = 30;
    atom_to_int["Ga"] = 31;
    atom_to_int["Ge"] = 32;
    atom_to_int["As"] = 33;
    atom_to_int["Se"] = 34;
    atom_to_int["Br"] = 35;
    atom_to_int["Kr"] = 36;
    atom_to_int["Rb"] = 37;
    atom_to_int["Sr"] = 38;
    atom_to_int["Y"] = 39;
    atom_to_int["Zr"] = 40;
    atom_to_int["Nb"] = 41;
    atom_to_int["Mo"] = 42;
    atom_to_int["Tc"] = 43;
    atom_to_int["Ru"] = 44;
    atom_to_int["Rh"] = 45;
    atom_to_int["Pd"] = 46;
    atom_to_int["Ag"] = 47;
    atom_to_int["Cd"] = 48;
    atom_to_int["In"] = 49;
    atom_to_int["Sn"] = 50;
    atom_to_int["Sb"] = 51;
    atom_to_int["Te"] = 52;
    atom_to_int["I"] = 53;
    atom_to_int["Xe"] = 54;
    atom_to_int["Cs"] = 55;
    atom_to_int["Ba"] = 56;
    atom_to_int["La"] = 57;
    atom_to_int["Ce"] = 58;
    atom_to_int["Pr"] = 59;
    atom_to_int["Nd"] = 60;
    atom_to_int["Pm"] = 61;
    atom_to_int["Sm"] = 62;
    atom_to_int["Eu"] = 63;
    atom_to_int["Gd"] = 64;
    atom_to_int["Tb"] = 65;
    atom_to_int["Dy"] = 66;
    atom_to_int["Ho"] = 67;
    atom_to_int["Er"] = 68;
    atom_to_int["Tm"] = 69;
    atom_to_int["Yb"] = 70;
    atom_to_int["Lu"] = 71;
    atom_to_int["Hf"] = 72;
    atom_to_int["Ta"] = 73;
    atom_to_int["W"] = 74;
    atom_to_int["Re"] = 75;
    atom_to_int["Os"] = 76;
    atom_to_int["Ir"] = 77;
    atom_to_int["Pt"] = 78;
    atom_to_int["Au"] = 79;
    atom_to_int["Hg"] = 80;
    atom_to_int["Tl"] = 81;
    atom_to_int["Pb"] = 82;
    atom_to_int["Bi"] = 83;
    atom_to_int["Po"] = 84;
    atom_to_int["At"] = 85;
    atom_to_int["Rn"] = 86;
    atom_to_int["Fr"] = 87;
    atom_to_int["Ra"] = 88;
    atom_to_int["Ac"] = 89;
    atom_to_int["Th"] = 90;
    atom_to_int["Pa"] = 91;
    atom_to_int["U"] = 92;
    atom_to_int["Np"] = 93;
    atom_to_int["Pu"] = 94;
    atom_to_int["Am"] = 95;
    atom_to_int["Cm"] = 96;
    atom_to_int["Bk"] = 97;
    atom_to_int["Cf"] = 98;
    atom_to_int["Es"] = 99;
    atom_to_int["Fm"] = 100;
    atom_to_int["Md"] = 101;
    atom_to_int["No"] = 102;
    atom_to_int["Lr"] = 103;
    atom_to_int["Rf"] = 104;
    atom_to_int["Db"] = 105;
    atom_to_int["Sg"] = 106;
    atom_to_int["Bh"] = 107;
    atom_to_int["Hs"] = 108;
    atom_to_int["Mt"] = 109;
    atom_to_int["Ds"] = 110;
    atom_to_int["Rg"] = 111;
    atom_to_int["Cn"] = 112;
    atom_to_int["Nh"] = 113;
    atom_to_int["Fl"] = 114;
    atom_to_int["Mc"] = 115;
    atom_to_int["Lv"] = 116;
    atom_to_int["Ts"] = 117;
    atom_to_int["Og"] = 118;
    edge_num = 0;
}

NR == 2 {
    n = $1;
    m = $2;
}

NR > 2 && NR <= 2 + n {
    idx = NR - 2;
    atom = $4;
    idx_to_atom[idx] = atom;
    if (!atom_to_int[atom]) {
        ++label_num;
        atom_to_int[atom] = label_num;
    }
}

NR > 2 + n {
    idx1 = $1;
    idx2 = $2;
    bond = $4;
    if (idx_to_atom[idx1] != "H" && idx_to_atom[idx2] != "H") {
        edge_start[edge_num] = idx1;
        edge_end[edge_num] = idx2;
        edge_type[edge_num] = bond;
        ++edge_num;
    }
}

END {
    print "p edge", n, edge_num;
    for (i=1; i<=n; i++) {
        print "v", i, atom_to_int[idx_to_atom[i]];
    }
    for (i=0; i<edge_num; i++) {
#        print "e", edge_start[i], edge_end[i];
        print "E", edge_start[i], edge_end[i], edge_type[i];
    }
}
