import os
import re

with open('src/jokers.lua') as file:
    text = file.readlines()

    for line in text:
        if line.startswith('assert'):
            path = re.findall(r'src/jokers/.+\.lua', line)[-1]
            if not os.path.exists(path):
                print(f'Create File {path}')
                with open(path, 'w') as file:
                    pass