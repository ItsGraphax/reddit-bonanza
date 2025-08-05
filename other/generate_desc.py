import os
import re

files = os.listdir("src/jokers")
creditregex = r"credit_badge\(\'(.+?)\'"
rarityregex = r"rarity = (\d)"

skip = [
    'src/jokers/8_ball.lua'
]

for file in files:
    oldname = file[:]
    file = "src/jokers/" + file
    if file in skip:
        continue
    filetext = open(file).read()

    name = oldname.replace('_', ' ').title()[:-4] # re.search(nameregex, filetext).group(1)
    credit = re.search(creditregex, filetext).group(1)
    rarity = re.search(rarityregex, filetext)
    rarity = rarity.group(1).strip()

    if rarity == "4":
        print(f"- {name} by [{credit}](https://reddit.com/u/{credit})")
