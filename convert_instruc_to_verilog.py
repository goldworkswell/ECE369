inFile='out.txt'
outFile='veroilog_code.txt'
with open(inFile)as f:
	lines=f.readlines()
i=0
f=open(outFile,"w")
for line in lines:
    line="Mempry[{}] <=32'b{};//{}".format(i,line[:32],line[32:])
    f.write(line)
    i+=1