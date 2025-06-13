import os
import re

files = os.listdir('src/jokers')
nameregex = r'name = \'(.+?)\''

planning = open('planning.md').read().lower()

for file in files:
    file = 'src/jokers/' + file
    filetext = open(file).read()

    name = re.findall(nameregex, filetext)[0].lower()
    if not name in planning:
        print(name)