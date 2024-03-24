+++
title = "Prototyping a USB mouse wiggler with CircuitPython"
date = 2024-03-23

[taxonomies]
tags = ["how-to", "project", "python", "circuitpython", "embedded"]
+++

> **tldr:** I need a USB mouse wiggler and I want to make it myself. I used a spare [Adafruit Neopixel Trinkey](https://www.adafruit.com/product/4870) with CircuitPython to prototype a simple mouse wiggler, which can be enabled/disabled with a touch. Handling "wiggling" state and input required some debouncing code, which was the most complicated part. The whole `code.py` script is available at the end.
> 
> This is a prototype-- I've had a hankering to learn embedded rust and this is how I did it. [A picture and comments are on my Mastodon](https://mastodon.social/@lynndotpy/112144884913215202). 

<!-- more -->
---

# Life's hard with two laptops that are eager to nap...

> **tldr:** Juggling two work laptops with work-mandated screen shutoffs required I dig into my microcontroller reserves.

In my day job, I have a problem: I have two laptops, a Mac and a Windows machine, both of which have a mandatory 5-minute screen timeouts.

I often find myself swapping between both laptops, working on one for a bit, while the other locks. So, I am punished by these screen timeouts, even while sitting infront of both latpops! Logging in several times an hour is laborious and breaks my flow-state, and extended sleep turns off network-connections.

I've heard of "USB mouse wigglers" as the solution to this, but I can't just *trust* that these won't do something nefarious while it's at it. So, I decided to create one myself. [I am sure I will not regret this.](https://xkcd.com/196/)

My requirements are:

1. A microcontroller (like the PiPico) I can connect via USB C.
2. An integrated button to enable / disable the functionality, and
3. an LED indicator of whether the functionality is enabled or not.

Over the years, I've purchased many Raspberry Pi's from Adafruit, and many microcontrollers to bring myself over the "free shipping" bump. The [Adafruit Feather RP2040](https://learn.adafruit.com/adafruit-feather-rp2040-pico/overview) with an [USB-C to USB-C adapter](https://www.adafruit.com/product/5328) looked like just the thing I need.

This has an integrated button and an LED, and is based on the RP 2040 (the microcontroller powering the Pi Pico). I want to prototype with CircuitPython and eventually reimplement this in Rust. Adafruit products almost universally have good CircuitPython support, and the RP 2040 platform (which powers the Pi Pico) is popular enough that I imagine it must be well-supported for embedded Rust by now. ([Plus, there is also a whole crate titled `adafruit-feather-rp2040`](https://crates.io/crates/adafruit-feather-rp2040), so my hopes are pretty high.])

This blogpost will cover the prototype in CircuitPython.

# ... And Python makes life too easy.

> **tldr,** I want to prototype with CircuitPython first. To do this, I
> 
> 1. Install CircuitPython:
>   1. Plug the RP2040 Feather board in to your laptop via USB while holding the `BOOTSEL` button, so it'll act as a flash drive. Then,
>   2. [Download the latest CircuitPython UF2 to the board](https://circuitpython.org/board/adafruit_feather_rp2040/).
> 2. Start the CircuitPython REPL:
>   1. From my terminal, use `ls /dev/tty.*` to find the name of the TTY ("shell") which exposes the CircuitPython REPL.
>   2. Then I use `screen /dev/tty.usbmodem101` to connect to the REPL.
> 3. Iteratively implement the bits and pieces of work I need to do. During this process, I switch instead to [my Adafruit Neopixel Trinkey](https://www.adafruit.com/product/4870) with a USB A-to-C adapter.
> 
> You can skip this section-- the actual `code.py` is at the end. 



---

## I want to use CircuitPython to prototype but I need to actually install it first.

> **tldr:** I [download the latest CircuitPython UF2 for this board](https://circuitpython.org/board/adafruit_feather_rp2040/), copy over the `.uf2` file. CircuitPython starts instantly! Then, one uses `ls /dev/tty.*` to find where the REPL lives. For me, it's on `/dev/tty.usbmodel101`, so I run `screen /dev/tty.usbmodem101`, and voila, I'm in the REPL.

So, an aside: The Feather comes with a USB [UF2 bootloader](https://github.com/microsoft/uf2), which means adding new firmware is *just drag-and-drop*. This is pretty great.

I wanted to do this in Rust, but the Rust code-compile-flash-repeat loop has a lot of questions: How to build to a "hello world"? How exactly to address the LED? How to move the mouse?

... Actually, those are pretty much the only questions I have. [MicroPython](https://github.com/micropython/micropython) and it's easier-fork [CircuitPython](https://learn.adafruit.com/welcome-to-circuitpython) are fantastic for iterating. It exposes a USB filesystem with a `code.py` with a REPL and live-reload. 

Adafruit has examples and code for CircuitPython, so I'm starting by [downloading the latest CircuitPython UF2 for this board](https://circuitpython.org/board/adafruit_feather_rp2040/), which instantly starts running CircuitPython. Hooray :)

[Per Adafruit, on MacOS and Linux,](https://learn.adafruit.com/welcome-to-circuitpython/advanced-serial-console-on-mac-and-linux) you can find the TTY where CircuitPython exposes the terminal using `ls /dev/tty.*`. For me, it's `/dev/tty.usbmodem101`, so I run `screen /dev/tty.usbmodem101` to connect to it.

## Prototype priority one: This LED is hurting my eyes so I want to turn it off

When plugged in, the bright neopixel activates. This LED (an Adafruit "neopixel") is hurting my eyes, so I want to turn it off. A quick `help("modules")` shows me the `neopixel_write`, so I use `help` to figure things out and...

```python
# this LED is hurting my eyes so I want to turn it off
import neopixel_write as nw
help(nw)
#object <module 'neopixel_write'> is of type module
#  __name__ -- neopixel_write
#  neopixel_write -- <function>
help(nw.neopixel_write)
#object <function> is of type function

# ... okay, that is not helpful
```

The `help` in CircuitPython is not as complete as real-Python, so I instead [look at the neopixel docs](https://docs.circuitpython.org/en/9.0.x/shared-bindings/neopixel_write/index.html). From this example, I'm able to push some lines and turn it off.

```python
import board
import neopixel_write
import digitalio

pin = digitalio.DigitalInOut(board.NEOPIXEL) # this is "DigitalInOut"
pin.direction = digitalio.Direction.OUTPUT
pixel_off = bytearray([0, 0, 0])
neopixel_write.neopixel_write(pin, pixel_off)
```

Wonderful. So, I start to build my "grimoire" (collection of code snippets).

```python
import board
from neopixel_write import neopixel_write
import digitalio

# Constants

pin = digitalio.DigitalInOut(board.NEOPIXEL)
pin.direction = digitalio.Direction.OUTPUT

_led_off = lambda: neopixel_write(pin, bytearray([0,0,0]))
_led_red = lambda: neopixel_write(pin, bytearray([0,1,0]))
```

(Btw, my neopixel is indexed GRB, and even `[0,1,0]` of 255 is bright enough for me. [This is because these values control wattage and aren't normalized for perceived brightness.](https://mastodon.social/@lynndotpy/112144884913215202).) 

## Prototype priority two: Oh wait I have a way better Adafruit devboard

> **tldr:** I switched to [my Adafruit Neopixel Trinkey](https://www.adafruit.com/product/4870). I needed to flash a different version of CircuitPython, and because this has four neopixels and not one, I have to push a 12-byte array and not a 3-byte array.

Like I said, I've bought a lot of Adafruit devboards over the years to bump my Raspberry Pi's over to free shipping.

It was at this point I realized [my Adafruit Neopixel Trinkey](https://www.adafruit.com/product/4870) was way more appropriate for this. It has four LEDs, so I write a twelve-byte bytearray.

A quick update to my grimoire:

```python
import board
from neopixel_write import neopixel_write
import digitalio

# Constants

pin = digitalio.DigitalInOut(board.NEOPIXEL)
pin.direction = digitalio.Direction.OUTPUT

_led_off = lambda: neopixel_write(pin, bytearray([0]*12))
_led_red = lambda: neopixel_write(pin, bytearray([0,1,0]*4))

_led_off()
```

## Prototype priority three: Okay rad, let's activate those buttons and wiggle that mouse

[Adafruit's examples make this very straightforward.](https://learn.adafruit.com/adafruit-proximity-trinkey/capacitive-touch)

```python
import touchio
touch = touchio.TouchIn(board.TOUCH1)
print(touch.value)
```

## Prototype priority four: And let's wiggle that mouse 

The first reference I ended up finding [was `user/daedalusesq`'s post on `r/raspberrypipico`](https://www.reddit.com/r/raspberrypipico/comments/16accfj/circuitpython_mouse_jiggler/).

```python
import usb_hid
from adafruit_hid.mouse import Mouse
m = Mouse(usb_hid.devices)

# yesss
m.move(1,0)
m.move(0,1)
m.move(-1,1)
```

## Prototype priority five: Handle the basic input.

> **tldr:** I want to toggle the mouse wiggler by touching either of the capacitive buttons. This requires debouncing the input, otherwise the state will rapidly invert while the buttons are pressed.

First, we need to get inputs and set a state (wiggling on / off). We'll have the usual process loop. We'll also want any inputs not to be "repeated" when held. This is called "debouncing", which I love because that means I get to have two booleans titled `wiggling` and `debouncing`, which are far more whimsical names than the average boolean.

```python
import board
from neopixel_write import neopixel_write
import digitalio
import touchio
import usb_hid
from time import sleep
from adafruit_hid.mouse import Mouse

# Set up constants for input/output
pin = digitalio.DigitalInOut(board.NEOPIXEL)
pin.direction = digitalio.Direction.OUTPUT
touch1 = touchio.TouchIn(board.TOUCH1)
touch2 = touchio.TouchIn(board.TOUCH2)
mouse = Mouse(usb_hid.devices)

_led_off = lambda: neopixel_write(pin, bytearray([0]*12))
_led_red = lambda: neopixel_write(pin, bytearray([0,1,0]*4))

# Wiggling is activated by default
wiggling = True
debouncing = False

_led_red()

while True:
  sleep(0.25)
  
  # If the pads are touched, invert wiggling state
  if touch1.value or touch2.value:
    if not debouncing:
      debouncing = True
      wiggling = not wiggling
  else:
    debouncing = False

  # Display the state
  if wiggling:
    _led_red()
  else:
    _led_off()
  
```


Awesome. Now all that's left is to add mouse wiggling :)

# Prototype complete. 😎 Let's wiggle 😎

All that's left is to add the appropriate `mouse.move` and `_led_red()`/`_led_off()` calls.

This will wiggle the mosue every four minutes while active :) This is the code you can copy-and-paste directly into `code.py`. Keep in mind you'll need to change specifics for different Adafruit boards.

```python
import board
from neopixel_write import neopixel_write
import digitalio
import touchio
import usb_hid
from time import sleep
import time
from adafruit_hid.mouse import Mouse

# Set up constants for input/output
pin = digitalio.DigitalInOut(board.NEOPIXEL)
pin.direction = digitalio.Direction.OUTPUT
touch1 = touchio.TouchIn(board.TOUCH1)
touch2 = touchio.TouchIn(board.TOUCH2)
mouse = Mouse(usb_hid.devices)

# Methods to turn LEDs on and off
_led_off = lambda: neopixel_write(pin, bytearray([0]*12))
_led_red = lambda: neopixel_write(pin, bytearray([0,1,0]*4))

# Input state
wiggling = True
debouncing = False

# Maintain timers for wiggling.
WIGGLE_INTERVAL = 4*60
start_time = time.monotonic()

# Turn the lights on to represent the wiggling state
_led_red()

# Let's go:
while True:
  sleep(0.25)
  
  # If the pads are touched, invert wiggling state
  if (touch1.value or touch2.value):
    if not debouncing:
      debouncing = True
      wiggling = not wiggling
  else:
    debouncing = False

  # Time to wiggle
  if wiggling:
    # Display the state and wiggle
    _led_red()
    if time.monotonic() >= start_time + WIGGLE_INTERVAL:
      # Time to wiggle!
      # Restart timer
      start_time = time.monotonic()
      # Wiggle diagonally
      mouse.move( 2,  2)
      time.sleep(0.0625)
      mouse.move(-4, -4)
      time.sleep(0.0625)
      mouse.move( 2,  2)
    
  else:
    start_time = time.monotonic()
    _led_off()
```

# P.S. What's next?

> **tldr:** More complicated LED control, and underclocking. 

As a bonus, I replaced `_led_red()` with this function which provides a slow "rotating" effect to the LEDs with a time period of `8` and a maximum brightness of `tt`. As mentioned, brightness is not logarithmic, so it's less of a 'smooth spinning' and more of a rotating blinking. Still, it feels fancy and fun.

```python
def _tri(tt, pp):
  # triangle wave maxing at pp//2
  tp = tt%pp
  return tp - min(0, pp//2 - tp)

def _led_spin_red():
    pp = 8 # time period
    tt = int(time.monotonic())
    neopixel_write(
      pin,
      bytearray(
        [
          0, _tri(tt, pp), 0,
          0, _tri(tt+2, pp), 0,
          0, _tri(tt+4, pp), 0,
          0, _tri(tt+6, pp), 0,
        ]
      )
    )
```

What else is left? Well, I'd like to reimplement this in Rust, and then dynamically underclock the processor as needed. This code still works in terms of absolute time, which I *think* is read independent of clock-speed.
