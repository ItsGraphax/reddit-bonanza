import os
import re

files = os.listdir('src/jokers')
locregex = r'loc_txt = ([\s\S]+?[^{a-zA-Z]},)'

for file in files:
    filepath = 'src/jokers/' + file
    filetext = open(filepath).read()

    loc = re.search(locregex, filetext)
    if not loc:
        print(f'Couldn\'t find loc_txt in {filepath}')
        continue
        
    loc = loc.group(1)
    loc = f'\tj_reddit_{file[:-4]} = ' + loc
    print(loc)