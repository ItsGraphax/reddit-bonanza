import os
import re

files = os.listdir('src/jokers')
locregex = r' *loc_txt = [\s\S]+?[^{a-zA-Z]},\n'

for file in files:
    filepath = 'src/jokers/' + file
    filetext = open(filepath).read()
    with open(filepath, 'w') as filef:
        name = re.search(locregex, filetext)
        if not name:
            print(f'Couldn\'t find loc_txt in {filepath}')
            continue
            
        filef.write(re.sub(locregex, '',  filetext))