import os
words = {}
langs = {}
with open('word.txt') as f:
    for item in f.read().split('\n'):
        row = item.split(';')
        if row[0]:
            word = row[0]
            desc = 'WORD'
            lang = {'all',}
            if len(row) > 1:
                s = row[1].strip()
                if s:
                    desc = s
            if len(row) > 2:
                lang = set(row[2].split())
            w = {'word':word, 'desc': desc, 'lang':lang}
            words[word] = w
            for l in lang:
                if l not in langs:
                    langs[l] = []
                langs[l].append(w)


for lang, wordlist in langs.items():
    content = 'priority -60'
    for w in wordlist:
       content += f'''
snippet {w['word']} "{w['desc']}"
endsnippet'''
    
    dir = 'UltiSnips/'+lang
    os.makedirs(dir,exist_ok=True)
    with open(dir+'/words.snippets','w') as f:
        f.write(content)

    print(lang,'--------------------')
    print(content)
    
                

