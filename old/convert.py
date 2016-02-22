arg = open("plotfin.col")
finstr = ""
for l in arg.readlines():
	things = l.split()
	finstr += things[0] + "\t\t" +  str((float(things[1]) * 2**30) / 1000000000) + "\n"
arg.close()
dest =  open("plotfin.col","w")
dest.write(finstr)
dest.close()
