from tempfile import gettempdir
import subprocess
import logging
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

