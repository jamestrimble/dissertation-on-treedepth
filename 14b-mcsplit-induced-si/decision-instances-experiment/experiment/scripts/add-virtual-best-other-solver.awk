NR==1 {print $0, "vbos", "vbmcsplit"}
NR>1  {
    vbos = $8;
    if ($9<vbos) vbos = $9;
    if ($10<vbos) vbos = $10;
    if ($11<vbos) vbos = $11;
    if ($12<vbos) vbos = $12;

    vbmcsplit = $3;
    if ($6<vbmcsplit) vbmcsplit = $6;
    if ($7<vbmcsplit) vbmcsplit = $7;
    print $0, vbos, vbmcsplit;
}
