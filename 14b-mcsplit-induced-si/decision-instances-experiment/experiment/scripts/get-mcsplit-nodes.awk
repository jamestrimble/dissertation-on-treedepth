/Nodes:/ {nodes = $2}
/TIMEOUT/ {nodes = -1}
END {print nodes}
