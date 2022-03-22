import logging
logging.basicConfig(filename='k.log', encoding='utf-8', level=logging.DEBUG)


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
    logging.debug((k,l,p))
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
