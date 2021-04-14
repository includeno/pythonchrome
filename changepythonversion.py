import os
import uuid

dockerpythonversion="dockerpythonversion"
symbol = "python:3.9.4"
infile = open(dockerpythonversion, mode="r", encoding="utf-8")
currentversion=infile.readline()
infile.close()
currentversion=currentversion.split("=")[-1]#python:3.9.4


def replace_python_version(infilepos:str,outfilepos:str):
    flag=False#不使用同一个文件进行操作
    if(os.path.abspath(infilepos)==os.path.abspath(outfilepos)):
        flag=True
    if(flag==True):
        outfilepos=str(uuid.uuid1())+".txt"
    infile=open(infilepos,mode="r",encoding="utf-8")
    outfile=open(outfilepos,mode="w",encoding="utf-8")
    
    for line in infile:
        if (line.count(str(symbol)) > 0):
            line=line.replace(symbol,currentversion)
        outfile.write(line)
    infile.close()
    outfile.close()
    if(flag==True):
        readfrom=open(outfilepos,mode="r",encoding="utf-8")
        writeto=open(infilepos,mode="w",encoding="utf-8")
        for line in readfrom:
            writeto.write(line)
        readfrom.close()
        writeto.close()
        os.remove(outfilepos)
replace_python_version("Dockerfile", "Dockerfile")

infile = open(dockerpythonversion, mode="r", encoding="utf-8")
lines=infile.readlines()
infile.close()
outfile = open(dockerpythonversion, mode="w", encoding="utf-8")
for line in lines:
    if (str(line).count(":") > 0):
        line = str(line).replace(":", "-")
        outfile.write(line)
outfile.close()