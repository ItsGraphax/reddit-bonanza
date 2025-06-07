import os
import re

files = os.listdir('src/jokers')
regex = r'create_badge\(\'by u/([a-zA-Z0-9_]+)\', CREDIT_TEXT_BG_COLOR, CREDIT_TEXT_COLOR, CREDIT_TEXT_SIZE\)'

for file in files:
    file = 'src/jokers/' + file
    filetext = open(file).read()
    
    badge = re.findall(regex, filetext)
    if badge:
        reptext = re.sub(regex, 'credit_badge(\'\\1\', false)', filetext)
        with open(file, 'w') as file:
            file.write(reptext)

