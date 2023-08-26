+++
title = "protip.py: the main-main pattern"
date = 2023-06-24

[taxonomies]
tags = ["how-to", "python"]
+++

> **TLDR:** Your Python program will be better if you define a `main()` function separate from the `__main__` block.

Consider a Python program `leftpad.py`, which takes an input string (say, `trans rights`), and pads it to the left (so, `python leftpad.py -s 'trans rights' -n 16` prints `'    trans rights'`.)

This is a great way to structure it:

```python
# leftpad.py
import argparse

# leftpad function in global scope can be imported
def leftpad(string, num_chars):
    if len(string) >= num_chars:
        return string
    else:
        pad = ' ' * (num_chars - len(string))
        return pad + string

parser = argparse.ArgumentParser()
parser.add_argument("--string", "-s", type=str, nargs=1)
parser.add_argument("--num","-n", type=int)

if __name__ == '__main__':
    args = parser.parse_args()
    print(leftpad(args.string[0], args.num))
```

The main functionality and the parser can be imported as `leftpad.leftpad(...)` and `leftpad.parser`. These could not be imported if `__main__` had the definition for `leftpad` and the instantiation of `parser`.

Here's a template you can use for your Python scripts:


```python
import sys

def main():
    try:
        return 1
    except:
        return 0

if __name__ == '__main__':
    sys.exit(main())
```

Let me explain why this is good, how it could be worse, and how it could be better.

<!-- more -->


1. This uses the `if __name__ == '__main__'` block, so `import leftpad` won't try to parse args and print them with `args = parser.parse_args()`.
2. Very little functionality is kept inside the `__main__` block. This allows one to `import leftpad` and use `leftpad.leftpad` and `leftpad.parser`. This is good for code reuse, for code testing, etc.

Compare it to this naive version, where all the functionality lives inside the `__main__` block. This is bad!

```python
# leftpad_naive.py -- bad!
import argparse

if __name__ == '__main__':
    # parser can't be imported, it's trapped in __main__
    parser = argparse.ArgumentParser()
    parser.add_argument("--string", "-s", type=str, nargs=1)
    parser.add_argument("--num","-n", type=int)
    
    args = parser.parse_args()
    string = args.string[0]
    num_chars = args.num
    
    # the leftpad functionality is also trapped in __main__
    if len(string) >= num_chars:
        print(string)
    else:
        pad = ' ' * (num_chars - len(string))
        print(pad + string)
        
```

[The Python docs consider this pattern idiomatic](https://docs.python.org/3/library/__main__.html). Here is a more complete version, which extends the functionality, wraps `leftpad.leftpad` in a `main` function which returns exit codes, and provides a function to generate `parser` (rather than instantiating it as a singleton).


```python
# leftpad_best.py

import sys
import argparse

def leftpad(string, num_chars, pad_char=' '):
    # improvement 1: pad_char parameter
    # pad_char defines a default, so we can call leftpad
    # as leftpad('trans rights', 16), just as before.
    if pad_char is None:
        pad_char = ' '
    if len(string) >= num_chars:
        return string
    else:
        pad = pad_char * (num_chars - len(string))
        return pad + string

def main(string, num_chars, pad_char=' '):
    # improvement 2: `main()` returns an exit code
    # 0 = good, 1 = error
    # note: 'main' is not a special function name
    try:
        print(
            leftpad(
                string=string,
                num_chars=num_chars,
                pad_char=pad_char
            )
        )
        return 0
    except:
        return 1

# improvement 3: parser is provided by a function, not a singleton
def get_parser():
    parser = argparse.ArgumentParser(description="like echo, but leftpad")
    parser.add_argument(
        "--string", "-s",
        help="String to pad.",
        type=str,
        nargs=1
    )
    parser.add_argument(
        "--num","-n",
        help="Number of integers to leftpad with",
        type=int
    )
    parser.add_argument(
        "--char", "-c",
        help="Char to pad with"
    )
    return parser

if __name__ == '__main__':
    parser = get_parser()
    args = parser.parse_args()
    # improvement 2 (see above): exit code returned here
    sys.exit(main(args.string[0], args.num, args.char))
```

One can improve the above further with type hints, docstrings, and raising errors.


For more reading,
 - [tldp.org/LDP/abs/html/exitcodes.html](https://tldp.org/LDP/abs/html/exitcodes.html) for standard exit codes to exit on with `sys.exit()`
 - Read more about `__main__`, the top-level code environment, and the main-main pattern: [docs.python.org/3/library/\_\_main\_\_.html](https://docs.python.org/3/library/__main__.html)
 - The `__main__` block is not the only special "dunder". Read more about all the other special names here: [docs.python.org/3/reference/datamodel.html#special-method-names](https://docs.python.org/3/reference/datamodel.html#special-method-names
 )
