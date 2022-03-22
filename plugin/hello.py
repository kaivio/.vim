
from rich import inspect


def comment():
    r = vim.current.range 
    b = vim.current.buffer
    for i in range(len(r)):
        n = i+r.start
        b[n] = '# '+b[n]
            
