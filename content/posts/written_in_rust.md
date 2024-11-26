+++
title = "Yes, I want to know if your project is written in Rust"
date = 2024-01-06

[taxonomies]
tags = ["post", "rust"]
+++


> **tldr:** A post is titled "My cool new thing, written in Rust." The top comment asks, "Why should I care that it's written in Rust?"
> 
> Well, I care! I love knowing when something is written in Rust. The main thing is that it's probably easy to `cargo install your_cool_new_thing`. I can't say the same for anything asking me to interact with `npm`, `pip`, `make`, `apt`, flatpaks or appimages, etc.
> 
> This post starts with a diatribe about `pip` and `npm`, evangelizing the virtues of `cargo`. The other benefits listed are the performance benefits from Rust's memory safety, and reassurances that Rust won't die anything soon (meaning it won't drag other projects down with it.) 
> 
> So, yes, I want to know your thing is written in Rust!

Over the past few years, line after line, project after project, I've become one of those annoying Rust evangelists. It's hard to go back to the old way of doing things, and a big reason is `cargo`.

On occasion, a new Rust project will be posted to a site like [lobste.rs](https://lobste.rs/s/hheh5v/cli_email_client_written_rust), with a title like "A `$THING`, written in Rust". Somone will invariable reply "Why should I care it's written in Rust?"

Well, I care, and this is why.

<!-- more -->

# First, a love letter to Rust's `cargo`

> **tldr:** Ever pull your hair out over `pip`, `npm`, `make`, etc? Come check out Rust's `cargo`. I <3 `cargo`, because I haven't pulled my hair out over it yet.  I have never ran into dependency issues. Everything is in one place, `Cargo.toml`, and I've never had any pranks pulled on me.

Before I can tell you *why* I want you to tell me your project is written in Rust, I would like to complain a lot about other languages, primarily Python and Pip.

## So, first first, a breakup letter to Python's `pip`

> **tldr:** Properly packaging Python projects is seen as pointless, and so is rarely performed. This presents a problem for programmers who wish to reproduce research papers. It's an error-prone process even for proficient Python programers.
> 
> Yes, installing *and* publishing with `pip` is unnecessarily difficult.

Python is the language I have the most experience with, at about a decade of regular usage. I love Rust, but Python is still the *fastest* way I know how to code.

I can confidently say that `pip` has not aged very well, and was just as difficult to use in 2014 as it is in 2024. It's alright when everything is in Python and you're using software which follows best practices. But when I was doing machine learning research from 2017 to 2022, it was *hell*, because research code often comes with underspecified and external non-Python dependencies.

A major source of pain is that `pip` tooling is generally focused around maintaining *environments* which are detached from *projects*. It does little of the work for you, which means it's very easy for a tired grad student crunching for a deadline to simply _not_ publish a `requirements.txt` or even a CUDA version with their code.

Example: When you, say, `python3 -m pip install yodalist`, you're installing it to the currently active environment. Activating environments requires running `source path_to_environment/bin/activate`. There is no `package.json` or equivalent: If you want one env per project, you need to handle that yourself. (This is also true for `conda`, but the [`poetry`](https://python-poetry.org/docs/) project seems promising.)

Things are worse is when you try to *publish* a project. [When I wrote `yodalist`](https://pypi.org/project/yodalist/), I did so with the goal of learning how to publish a project to PyPi. It is a bit of an ordeal, it took an hour to figure out, and I forget the steps which are necessary. With Rust, it's a breeze, with a simple `cargo publish`.

For a better breakdown of the differences between pip and cargo, please see this ["pip and cargo are not the same" (2022) at williammanley.net](https://blog.williammanley.net/2022/02/23/pip-and-cargo-are-not-the-same.html). 


## A breakup letter to NPM, too

> **tldr:** While `pip` can learn a lot from `npm`, I still quite enjoy my experience with `cargo` compared to `npm`.

Later on, as a webdev, I had similar problems with NPM. NPM generally handles dependencies per-project (think your `package.json` file per-repository) as well as allowing you to install things globally (e.g. `npm install -g @angular/cli`).

One big issue is that `package.json` is used to generate the _real_ list of packages, `package-lock.json`, and that `package.json -> package-lock.json` mapping is not deterministic. This means, counterintuitively, you cannot delete your `package-lock.json`. [As "skyboyer" on StackExchange puts it, if you do, "it can and will affect all the project in really bad way."](https://stackoverflow.com/questions/54124033/deleting-package-lock-json-to-resolve-conflicts-quickly)

Generally, being a proper web developer requires using `nvm` (the "node version manager") to manage different versions of `npm`. This is a bit annoying and I've pulled my hair out trying to solve dependency issues with NPM too.

## The rest

There are similar stories for dynamic-linking with libraries built from `C` and `C++`, but I think that's really on me for trying to compile from source.

But `cargo` does static linking by default, which means I never have any problems compiling from source. Computer disks start at >200GB nowadays, so [I'd much rather have a 3MB `hello-world`](https://stackoverflow.com/questions/29008127/why-are-rust-executables-so-huge) than have to worry about dynamic linking.

This makes Rust projects easy to install. Speakling of which...

# If your project is written in Rust, I know it's easy to install!

> **tldr:** Most Rust projects I've wanted to try are just one `cargo install` away.

My first foray into Rust was using `cargo` to install tools. I love [`eza` (like `ls`)](https://github.com/eza-community/eza), I love [`bat` (like `cat`)](https://github.com/sharkdp/bat), I love [`ripgrep`](https://github.com/BurntSushi/ripgrep/), I love [`btm` (like `top`)](https://github.com/ClementTsang/bottom), I love [`dust` (like `du`)](https://github.com/bootandy/dust), I love [`alacritty` (terminal)](https://github.com/alacritty/alacritty).

The thing is, once you [install Rust](https://www.rust-lang.org/tools/install), all you need to do is type `cargo install eza`, etc. to install these. It'll compile these from source on your machine, and then it'll be *ready to use.*

This isn't true for *every* Rust project, just most of them. Some projects choose not to be on crates.io, and some projects use external dependencies. [The Helix editor doesn't use crates.io and so the source must be pulled manually](https://github.com/helix-editor/helix/issues/42), and [the Lapce editor does the same and *also* has dependencies not handled by `cargo`,](https://github.com/lapce/lapce/blob/master/docs/building-from-source.md).


# If your project is written in Rust, I know it's (probably) faster!

> **tldr:** Memory safety means security *and* it means more consistent speed and memory usage. This is on top of Rust being one of the faster languages.
> 
> I really don't care about the security benefits as much as I love the speed benefits. I love when things are fast, actually!

In 2015, I was playing Minecraft with some friends, on a laptop I outfitted with a massive *8GiB of RAM*, but I kept getting intermittent freezes, no matter how much memory I allocated to the JVM. Adding memory actually *worsened* the problem, [(which turned out to be Java's garbage collector blocking the process.)](https://gaming.stackexchange.com/questions/219786/how-can-one-remove-lag-spikes-due-to-memory-dumps) Every time the GC came by to sweep, it paused the game to empty the memory.

Rust has no VM, no garbage collector, and therefore, none of those issues. This is a _very_ nice side effect of the uncompromising emphasis on memory safety. As a dev, this means your [`unsafe` Rust](https://doc.rust-lang.org/nomicon/what-unsafe-does.html) footprint is small enough to keep close tabs on, if you use it at all. (In practice, I've only ever seen `unsafe` used to  call C or C++ code. )

The security benefits are nice [(per the CISA, 70% of CVEs are memory safety bugs)](https://www.cisa.gov/news-events/news/urgent-need-memory-safety-software-products), but the speed is what I love.

When I ported [Reso from Python to Rust](https://github.com/resolang/reso), the change in language, algorithm, and choice of datastructures lead to a ~20,000x performance boost in some scenarios. (That's twenty-thousand times, not 20000%. Two milliseconds is better than 40 seconds!) A big part of this was how the design of Rust made it a simpler choice to implement graph incidence as a list of indices rather than using a HashMap (comparable to the `dict` I used heavily in Python).



# If your project is written in Rust, I know Rust won't die and pull your project down with it

> **tldr:** Some projects die because the language it's written in is deprecated, has a dearth of developers, or has dependencies which disappear.
> 
> I don't think this will happen to Rust any time soon, so I feel comfortable coming to rely on Rust projects.

Rust is widely adopted enough to the point where, if Rust stops being supported, it will be mildly existential across the industry. Rust is now used in [the Linux kernel](https://lore.kernel.org/lkml/202210010816.1317F2C@keescook/), in [NT (the Windows kernel)](https://www.youtube.com/watch?v=8T6ClX-y2AE), in [npm](https://www.rust-lang.org/static/pdfs/Rust-npm-Whitepaper.pdf). Rust is the dominant language of [Fuchsia, if it counts.](https://fuchsia.googlesource.com/) Rust is supported for [AWS Lambdas](https://docs.aws.amazon.com/lambda/latest/dg/lambda-rust.html), and soon, Rust will be inside [Google Chrome](https://github.com/chromium/chromium/blob/2bdef254aec631e268c4b8d57482624449257588/docs/rust.md).

Rust is also widely adopted to the point where Rust devs will continue to exist for a decade or two. Rust has a notable amount of popularity [according](https://github.blog/2023-11-08-the-state-of-open-source-and-ai/) to [survey](https://survey.stackoverflow.co/2023/#section-admired-and-desired-programming-scripting-and-markup-languages) and [index](https://www.tiobe.com/tiobe-index/) and [ranking](https://pypl.github.io/PYPL.html) and [analysis](https://madnight.github.io/githut/#/pull_requests/2023/3) I can find.

I compare this to something like Julia, which *seems* excellent, but leaves me worried that I'll learn it well and then see it become deprecated. Even if the language is maintained, today's Julia dependencies might be deprecated tomorrow, and todays Julia developers might 9 years out-of-date in a decade.

# "Written in Rust" considered cool and good to say

> **tldr:** I care about technology I use and Rust is one of those. I want to know when your project is written at Rust.

As a developer, I just feel more confident working with Rust projects. When I get error messages, I often refer to the source-code on how to proceed. Because I write Rust, I can dig deeper and leave better bug reports. (I even feel more confident about contributing, because again, *cargo makes it easy.* But this isn't about *writing* Rust, it's about *using* it.)

This is why the occasional Rust community kerfuffles don't phase me. Rust has cemented itself as something that cannot be allowed to die. Maybe in 40 years, that will be something we curse. But for now, I feel stable and happy writing Rust and using applications written in Rust.

And, let's be honest: The big reason to add "written in Rust" is when aiming at the other Rust enthusiasts. Being enthusiastic is a good thing! There is nothing wrong with being enthusiastic on the internet.
