import os
import re

files = os.listdir('src/jokers')
nameregex = r'name = \'(.+?)\''
creditregex = r'credit_badge\(\'(.+?)\''

users = set()

skip = [
    'src/jokers/8_ball.lua'
]

for file in files:
    oldname = file[:]
    file = 'src/jokers/' + file
    
    if file in skip:
        continue
    
    filetext = open(file).read()

    name = name = oldname.replace('_', ' ').title()[:-4] #re.findall(nameregex, filetext)[0]
    credit = re.search(creditregex, filetext).group(1)
    

    users.add(f'    - [u/{credit}](https://reddit.com/u/{credit})')

for user in users:
    print(user)
