+++
title = "Python on your phone sucks less with `ooo.py` and the `-i` flag."
date = 2022-05-22

[taxonomies]
tags = ["post"]
+++


> **TLDR:** Copy the script below, and run it as `python -i ooo.py`. This will give you a bunch of useful imports with short aliases, and throw you into an interactive shell.


```python
'''Run as `python3 -i ooo.py`

I use this when writing Python scripts on my phone (through Termux). The point is to minimize the keypresses needed when writing Python on a phone.

This will start Python, import a bunch of modules with short names, and then throw you into an interpreter.
'''

import numpy as np
import pandas as pd
import math as mt
import random as rd
import time
import itertools as it
import functools as ft
import re
import os
import sys
import glob
import pickle as pl
import hashlib as hl
import secrets as ss
import socket as sk

print("imported numpy as np, pandas as pd, math as mt, random as rd, time, itertools as it, functools as ft, re, os, sys, glob, pickle as pl, hashlib as hl, secrets as ss, and socket as sk!")

A = np.array

PI = mt.pi
TAU = mt.tau
E = mt.e

print("Constants available: PI, TAU, E .")

H = help
Q = quit

print("Functions `help(...)` and `quit()` available as `H(...)` and `Q()`.")
```

---

Here is a real-time video of the script in action, used for writing a Monte Carlo simulation to estimate the value of Pi. 

![A screenrecording ](../images/ooopy.webm "asdf"){ width=240px }

---

Python in the terminal has effectively replaced my graphing calculator for quick calculations. Its REPL allows for interactive coding, so there is no compile-run-debug loop. The great thing is, I can also use this on my phone! (I used Termux on Android, but this might work on iOS through iSH.)

But coding on a phone sucks. But Python lets you bind almost anything to almost anything, so you can make it suck a bit less. I use a little script to set up a Python environment that is much more comfortable on the phone.

I call it `ooo.py` because `ooo.py` is fast to type. The script imports a bunch of useful tools, and with short names (e.g. `np` instead of `numpy`, `it` instead of `itertools`). The script also binds common functions and constants to shorter names. e.g. `A(...)` instead of `np.array(...)`, `PI` instead of `math.pi`. The script also prints all these shortcuts out, so you don't need to remember them all.

The real value comes from the `-i` flag. Running the script as `python -i ooo.py` will run all of `ooo.py`, but instead of exiting to shell, it'll throw you into a REPL! 

