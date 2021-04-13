import requests
import re
import os

#https://www.chrome64bit.com/index.php/google-chrome-64-bit-for-linux
url="https://www.chrome64bit.com/index.php/google-chrome-64-bit-for-linux"

res = requests.get(url)
html_origin = res.text

version = re.search('Version:(.*)<', html_origin)
version_number = (str(version.group(0)).split("<")[0]).split("Version:")[-1]
version_number=str(version_number).replace(" ","")
print(version_number)

date = re.search('Date:(.*)<', html_origin)
print(str(date.group(0)).split("<")[0])

file=re.search('File:(.*)<', html_origin) 
print(str(file.group(0)).split("<")[0])
filename = "chrome_version"
outfile = open(filename, "w", encoding='utf-8')
outfile.write("ChromeVersion="+version_number)
outfile.close()