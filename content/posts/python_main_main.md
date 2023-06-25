+++
title = "protip.py: the main-main pattern"
date = 2023-06-24

[taxonomies]
tags = ["how-to", "python"]
+++



Consider a Python program `leftpad.py`, which takes an input string (say, `trans rights`), and pads it to the left (so, `python leftpad.py -s 'trans rights' -n 16` prints `'    trans rights'`.

Here's how you should write it: With a "main" function `leftpad` and a `__main__` block:


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

And here's a template you can use for almost any Python script:


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


1. This uses the `if __name__ == '__main__'` block, so `import leftpad` won't try to parse args and print them.
2. Very little functionality is kept inside the `__main__` block. This allows one to `from leftpad` and use `leftpad.leftpad` and `leftpad.parser`. This is good for re-usability and testing.

Compare it to a naive version, where all the functionality lives inside the `__main__` block. This is bad!

```python
# leftpad_naive.py
# this one is worse!
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--string", "-s", type=str, nargs=1)
    parser.add_argument("--num","-n", type=int)
    
    args = parser.parse_args()
    string = args.string[0]
    num_chars = args.num
    
    # bad! the main functionality is trapped in the `__main__` block.
    # these lines cannot be imported 
    if len(string) >= num_chars:
        print(string)
    else:
        pad = ' ' * (num_chars - len(string))
        print(pad + string)
        
```

I came up with this pattern independently, but then learned [the Python docs consider this pattern idiomatic](https://docs.python.org/3/library/__main__.html).

Here is a more complete version, which extends the functionality, wraps `leftpad.leftpad` in a `main` function which returns exit codes, and provides a function to generate `parser` (rather than a singleton).


```python
# leftpad_best.py
# this one is the best!

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

One can improve the above further with type hints, documentations, and raising errors.


For more reading,
 - https://tldp.org/LDP/abs/html/exitcodes.html
 - Read more about `__main__`, the top-level code environment, and the main-main pattern: https://docs.python.org/3/library/__main__.html
 - The `__main__` block is not the only special "dunder". Read more about all the other special names here: https://docs.python.org/3/reference/datamodel.html#special-method-names
