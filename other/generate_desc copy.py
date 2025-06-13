import os
import re

files = os.listdir('src/jokers')
nameregex = r'name = \'(.+?)\''
creditregex = r'credit_badge\(\'(.+?)\''

users = set()

for file in files:
    file = 'src/jokers/' + file
    filetext = open(file).read()

    name = re.findall(nameregex, filetext)[0]
    credit = re.findall(creditregex, filetext)[0]
    

    users.add(f'    - [u/{credit}](https://reddit.com/u/{credit})')

for user in users:
    print(user)
