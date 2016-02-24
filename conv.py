newfname = "data/box.col"
with open(newfname,'w') as boxcol:
    datavals = [[] for _ in range(57)]
    for dn in range(1,12+1):
        fname = "data/d"+str(dn)+".col"
        with open(fname) as readfile:
            for dv,line in zip(datavals,readfile.readlines()):
                if line:
                    dv.append(float(line.split()[1]))

    boxcol.write("# ")
    for s in range(13,27):
        num_bt = 2
        for b in range((1 << num_bt) - 1,-1,-1):
            size = (1 << s) - (b << (s-num_bt-1))
            boxcol.write(" "+str(size))
    boxcol.write("\n")
    for i in range(12):
        boxcol.write(" ".join(str(datavals[n][i]) for n in range(56))+"\n")
