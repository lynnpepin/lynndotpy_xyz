+++
title = "GIMP <3 Python! Let's make a YuGiOh rip off"
date = 2020-12-31

aliases = ["posts/gimp_and_python.html"]

[taxonomies]
tags = ["how-to", "project"]
+++


> **tldr:**  Open the Python-Fu console (Filters > Python-Fu > Console) and reference GIMP's built-in `pdb` documentation (Help > Procedure browser).  A simple 'hello world' is presented:
> 
> > ```python
> > img = gimp.image_list()[0]
> > title_layer = pdb.gimp_image_get_layer_by_name(img, 'Title')
> > pdb.gimp_text_layer_set_text(title_layer, "Hello world!")
> > ```


<!-- more -->

---

# gimp is a good image editor, and you can automate it with python

For those unfamiliar with [GIMP (gimp.org)](https://www.gimp.org/), it is a free and open-source image editor, and one of my favorite tools.

I'm a long-time GIMP user and a long-time Python user. GIMP has this nifty feature called "PythonFu" that allows you to modify images using Python code. (GIMP also exposes a Scheme interface.) With GIMP and Python knowledge, it enables one to automatically edit images.  There are plenty of tutorials and documentation, but none of them enabled me to "get my hands dirty", which is why I'm writing this post.

Automating GIMP was useful for me when making a little Yu-Gi-Oh inspired card game. Instead of editing 60+ cards titles and descriptions by hand, I used a script to read a spreadsheet and do it for me. I'll edit this post once I have the code ready. :)

# the dev experience is janky! here's how i do it

> **tldr:** In four corners: GIMP editor, GIMP Python procedure browser for documentation, Python console, and a Python editor. Run scripts by copy and pasting them.

If you have experience with GIMP and Python and want to learn how to automate GIMP, then let me show you my basic GIMP Python scripting setup:

![A screenshot showing four windows open in tiled configuration: (1) A GIMP image-editing window with  a card-template reminiscent of Yu-Gi-Oh, (2) A 'procedure browser' showing a list of GIMP procedures with corresponding documentation, (3) An interactive Python console that programatically modifies the GIMP image, and (4) A text editor used as a 'scratch space' with a list of commands.](../images/gimp-python-dev-setup.png "A screenshot showing four windows open in tiled configuration: (1) A GIMP image-editing window with  a card-template reminiscent of Yu-Gi-Oh, (2) A 'procedure browser' showing a list of GIMP procedures with corresponding documentation, (3) An interactive Python console that programatically modifies the GIMP image, and (4) A text editor used as a 'scratch space' with a list of commands.")


I keep keep these four windows open on one screen:

1. The GIMP image I want to modify.
2. The Procedure Browser (under GIMP Help > Procedure Browser)
3. A GIMP Python console (under GIMP Filters > Python-Fu > Console)
4. A text editor as a workspace / scratchpad.

For those unfamiliar, the GIMP Python console is interactive. **Paste code into the console, hit enter, and the commands will execute within GIMP.**

# Some other tips

Get your hands dirty, try something out in the console! Most work that one can do manually can also be reproduced in code. (Some exceptions exist, such as text editing). The procedure browser is your friend when exploring and experimenting, and it is the most complete documentation I could find. This hacky workflow was instrumental in a number of small projects I was able to complete, and was one of the best GIMP skills I learned in these past 10 years. :)

Here are some other small things that I wish someone told me from the start:

 * AFAIK, there is no officially-supported method to run `pdb` headless in Python scripts. Your interactions have to be through the GIMP executable's bundled Python interpreter.
 * GIMP uses the "`pdb`" library for most interactions. This is *not* the same as the Python debugger.
 * To use a function in the Procedure Browser, say, "`gimp-image-set-active-layer`", you want to call "`pdb.gimp_image_set_active_layer`".
 * The Procedure Browser is the most complete and easy-to-search `pdb` documentation...
 * ... But some documented parameters will not match the Python libary. For example, the blur plugin "`plug-in-gauss-iir`" lists a "`run-mode`" parameter, but the function "`pdb.plug_in_gauss_iir`" does not use that parameter.
 * GIMP uses Python 2.7, but should be using Python 3 in 2021.

# hello world!

As a quick "hello world" example, consider the following steps:

1. Create a new image in GIMP
2. Add a text layer, with layer title "Title"
3. Open the Python console (Filters > Python-Fu > Console)
4. Enter the below lines into the console! Your text layer will be modified to say 'Hello world!".

> ```python
> img = gimp.image_list()[0]
> title_layer = pdb.gimp_image_get_layer_by_name(img, 'Title')
> pdb.gimp_text_layer_set_text(title_layer, "Hello world!")
> ```


