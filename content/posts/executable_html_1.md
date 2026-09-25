+++
title = "Before I write my markdown-tag preprocessor, I want to create a new standard for distributing software tools: The executable .html"
date  = 2026-09-25

[taxonomies]
tags  = ["project", "rust", "web"]
+++


> **tldr tldr**: I want to reboot my blog tooling with a `<md>` preprocessor tag. I want to write that in the executable `.html` files, with a combined GUI-TUI-CLI specification. I need to get these two ideas out of my head and into the real world.

> **tldr**: I want to eschew static site generators in favor of writing almost-pure HTML. But I write all my posts in Markdown.
> 
> Before I do that, I want to write a preprocessor which recognizes and processes a `<md>` tag.
> 
> But I want to write it as a single-file HTML app, since I want to write the most portable code possible.
> 
> But I also want to be able to execute this in the command line. So, I need to:
> - Come up with a specification for combining GUI, interactive TUI, and CLI arguments.
> - Come up with a specification for denoting CLI-accessible functionality inside a web browser.
> - Come up with a (probably Rust) executable that exposes functionality in .html to a terminal user using a webdriver.
> 
> As a first use case, I have [this IPS patcher](https://bbbradsmith.github.io/ipstool/) in my sights.
> 
> Incidentally, I also want to get good at "vibe coding". Employability and whatnot. Rest assured I will never put LLM-generated prose in a post. Not even in this summary. 



<!-- more -->

#  First, i wanted to create an html preprocessor with a `<md>` tag...

For all its flaws, I write almost everything in Markdown, specifically Obsidian. I draft posts in Obsidian before pasting it elsewhere. For all the horrors of the LLM era, I have to admit that I very much do love that a mainstream tool is Markdown-first. It's akin to the era when social media sites came with vimbindings by default. (Tumblr still does!)

But I've grown very disillusioned with static site generators. This site ran my own SSG, a Python script invoking Pandoc, from 2020 through 2023 until I switched to Zola. But Zola's regular breaking changes eventually forced me into a painful update process when I just wanted to post. And I find myself increasingly preferring to simply write html, as I did for [the site for my game project](https://carrion.0xpossum.dev/demake86).

But it's *painful* to write all those `<p>` tags. Maybe I could write a client-side JavaScript dom processor which takes a bespoke `<md>` tag and replaces it with HTML, but then I'd subject readers to need JavaScript. Instead, I'd like to write a preprocessor that can take my almost-HTML and produce real-HTML, doing very little else.

But before I start work on this project, I have another.

# But I am insane,

> **tldr**:
> - Single .html files are the most portable way to distribute software. So, I want to create new tooling in .html files when possible.
> - But .html files are not accessible to CLI users such as myself. So, I want to create new tooling to expose CLI functionality in .html files.
> - But CLIs are not accessible. So, I want to create tooling that falls back to an interactive TUI when flags are not presented. So, I want to create a combined way to represent the web GUI, the CLI, and the TUI all at once.

Before I create any new tooling for myself, I have to address numerous ideas that have been eating at my mind for years and years and years. 

First is **portability and accessibility**. The single most portable and accessible way to distribute tooling is as a single `.html` file. It's how this [IPS ROM patcher works](https://bbbradsmith.github.io/ipstool/), it's how the [GrapheneOS web installer works](https://grapheneos.org/install/web), etc. It works on iPhones, Android phones, feature phones which run neither, Windows, Linux, BSD, etc. It runs on everything with a browser.

The only problem here is that this excludes terminal users. There is no standard for exposing JavaScript functionality in a .html file in the CLI. So, I'll need a tool for that too which _does_ run in the terminal. Luckily, the **second most portable and accessible way** to distribute tooling is with Rust. As I've noted before, [`cargo` is better than `npm` et al, and statically-compiled executables are the best thing since sliced bread](https://lynndotpy.dev/posts/written-in-rust/).

I think this "execute HTML in your terminal" will require:

1. A specification for how to write the HTML. Tags, IDs, etc? How to define two different functions for the same command (considering how "echo" would operate differently in the browser)? Etc.
2. A CLI tool (written in Rust) to invoke a webdriver to execute the .html.

But at the same time, I want to improve CLIs first. My [Rust bin-lib-plus](https://github.com/lynnpepin/rust_bin_lib_plus) is an example of this: It's a binary which provides a library, and it's a CLI (written in `clap`) which falls back to a TUI (with `inquire`). When required CLI flags are not provided, one should fall-back to a TUI (with assumed or generated defaults). This way, one can simply run the binary and discover how to use the CLI by using the TUI. Those doing automation or writing shell scripts can simply provide all the necessary CLI flags.

But this would mean combining the CLI, the TUI, *and* the web GUI. So, it would also need to answer:

3. Should we have a common specification to generate the GUI, TUI, and CLI interfaces? Or should we instead derive the TUI and CLI from specially-tagged web GUI interfaces?
4. In either case, how?

I don't really know the best way to do this. I think the best way to climb a mountain is to take a few steps first. So,

# A rough map of the road ahead

> **tldr**: A few MVPs and sample projects will provide the answers I seek.

I don't have much free time any more, so I work on these projects in sprints of a few hours every month. I recently spent a lot of time on [my tiny free Metroidvania Demake86](https://opossumcarrion.itch.io/demake86), a passion-project for which I used absolutely no AI.

I much of the productivity gain from the LLM era comes from eschewing reliability standards and coding practices. But I simply must get more comfortable with using LLMs if I wish to be employed.

> Note that I will never use LLMs to write any prose for you to read. It's an insult and a disgrace to the audience and the author. I write in lists and have for awhile. If you check the web archive, you'll even see that ugly left-border that Claude-generated sites have was just a part of my site. I did it first, etc etc.

So, I have roughly the next few tasks set out for myself. The goal is to get some fresh experience which will inform how the specifications for the argument parsing will take place, and how the best way to architect this will be.

My goal is to minimize dependencies for the users, especially users of browser-based tools. So, everything should be in one .html file which can simply be downloaded, with the exception of the necessary executable which (probably using a webdriver) executes the .html file for terminal users.

1. MVP: Take an existing browser tool (like the CC0 [IPStool](https://bbbradsmith.github.io/ipstool/) mentioned above) and hook it into a webdriver using Rust. 
    - This will answer questions like "how to structure the code when the CLI and GUI will have slightly different functionality".
2. Improve the MVP with a "gold standard" CLI-falling-back-to-TUI.
    - I hope I can contrive this to involve every CLI primitive.
3. At this point, I hope I have a name for the (1) html "standard", the (2) Rust .html executor, and the concepts of (3) a CLI-falling-back-to-TUI and the combined GUI/TUI/CLI. 
4. Repeat steps 1 and 2 with my specialized Markdown preprocessor.
5. At this point, I hope I can answer the rest of the questions above, and have a ready-made "specification".

The universal GUI/TUI/CLI might best be done with a common, easy representation (JSON?) which generates a GUI with the proper tags. The .html executor would then parse this GUI to generate the CLI-falling-back-to-TUI.
