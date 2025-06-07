import os
import re

files = os.listdir('src/jokers')
nameregex = r'name = \'(.+?)\''
creditregex = r'credit_badge\(\'(.+?)\''

for file in files:
    file = 'src/jokers/' + file
    filetext = open(file).read()

    name = re.findall(nameregex, filetext)[0]
    credit = re.findall(creditregex, filetext)[0]
    
    print(f'- {name} by [{credit}](https://reddit.com/u/{credit})')
