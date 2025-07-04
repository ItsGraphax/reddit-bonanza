import os
import re

files = os.listdir('src/jokers')
nameregex = r'name = \'(.+?)\''
creditregex = r'credit_badge\(\'(.+?)\''
rarityregex = r'rarity = (\d)'

for file in files:
    file = 'src/jokers/' + file
    filetext = open(file).read()

    name = re.findall(nameregex, filetext)[0]
    credit = re.findall(creditregex, filetext)[0]
    rarity = re.search(rarityregex, filetext)
    rarity = rarity.group(1).strip()
    
    if rarity == '4':
        print(f'- {name} by [{credit}](https://reddit.com/u/{credit})')
