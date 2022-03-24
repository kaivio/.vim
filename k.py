from tempfile import gettempdir
import subprocess
import logging
import re
logger = logging.Logger('k',logging.DEBUG)
handle = logging.FileHandler(gettempdir()+'/k_debug.log')
handle.setLevel(logging.DEBUG)
#  fmt = logging.Formatter('%(ip)s %(message)s', defaults={"ip": None})
#  handle.setFormatter(fmt)
logger.addHandler(handle)

_k_it = set()
def _k_add(func):
    name = func.__name__[2:]
    _k_it.add(name)
    return func

@_k_add
def k_test():
    print('test',vim.eval('a:'))
@_k_add
def k_hello():
    print('hello',vim.eval('a:'))
@_k_add
def k_world():
    print('world',vim.eval('a:'))

def complete_k_test(key,line,pos):
    return ['2020','2021','2022']

def complete_k(rv):
    k,l,p = vim.eval('a:000')
    logger.debug((k,l,p))
    args = l.split(' ',2)
    items = []
    if len(args) > 2:
        comp = globals().get('complete_k_'+args[1],None)
        logging.debug(comp)
        if comp:
            items = comp(k,l,p)
    else:
        for i in _k_it:
            if i.startswith(k):
                items.append(i)

    vim.command('let %s = "%s"' % (rv,'\n'.join(items)))

@_k_add
def k_y():
    s = ""
    i = int(vim.eval('a:line1'))-1
    j = int(vim.eval('a:line2'))
    for k in range(i,j):
        s += vim.current.buffer[k]+'\n'
 
    cp = subprocess.run(['clipboard-set'],capture_output=True,text=True,input=s)
    print(f' {j-i}L copy')

@_k_add
def k_p():
    cp = subprocess.run(['clipboard-get'],capture_output=True,text=True)
    s = cp.stdout
    line = vim.eval('line(".")')
    n = int(line) 
    logger.debug(f'paste: {cp.returncode}\n{s}')
    logger.debug(f'line: {n}')
    logger.debug(vim.eval('a:'))
    for si in s.split('\n'):
        vim.current.buffer.append(si,n)
        n += 1

    print(f' {n}L inserted')


@_k_add
def k_color():
    from colour import Color
    nr = int(vim.eval('line(".")'))
    nc = int(vim.eval('col(".")'))
    line = vim.current.line

    logger.debug(vim.eval('a:'))
    logger.debug(line)
    logger.debug(nc)

    color, span = scan_token(line,nc-1,'#[0-9a-f]+','[^0-9a-f]')
    c = Color(color)
    new_color = None
    args = vim.eval('a:000')
    for arg in args:
        if arg == '+':
            l=c.get_luminance()
            c.set_luminance(l+0.1)
            new_color = c.get_hex_l()

    if new_color:
        j,k = span
        new_line = line[0:j]+new_color+line[k:]
        vim.current.line = new_line
        print(f'{color} => {new_color}')


def scan_token(s,i,patt,de_patt,flag=re.I):
    patt = re.compile(patt,flag)
    de_patt = re.compile(de_patt,flag)
    for j in range(i,-1,-1):
        sj = s[j:]
        m = re.match(patt, sj)
        if m:
            k = m.span()[1]+j
            token = s[j:k]
            logger.debug(f'scan_token {j}, {k} {token}')
            return (token,(j,k))
        elif re.match(de_patt, sj):
            logger.debug(f'scan_token_end {sj}')
            return ('',(-1,-1))

    return ('',(-1,-1))
    
    logger.debug(f'scan: {i}')

