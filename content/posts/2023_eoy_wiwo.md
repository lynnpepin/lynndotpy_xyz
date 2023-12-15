+++
title = "What I'm working on, December 2023"
date = 2023-12-14

[taxonomies]
tags = ["post", "blog"]
+++


2023 has been my year of Rust. I've gotten 50% of the way on my fantasy assembly language [Phantasm](https://github.com/lynnpepin/phantasm), the [Rust implementation of Reso](https://github.com/lynnpepin/reso-rust) is nearing the `0.1.0` release. I'm also preparing a Commodore64 emulator Christmas gift for my mother in law.

I've also started publishing [arbitration opt-out templates](https://github.com/lynnpepin/arbitration-opt-out-templates) to make it easier for people to opt out of arbitration.

In projects not-even-near completion, I've been drafting up a puzzler with 5 space and 2 time dimensions, and I'm resurrecting drafts for a cryptographic hash primitive with a variable hamming weight digest.

For me, my biggest side project right now is definitely Reso. I'm super proud of it. The language implementation work is done, and I'm excited to build tooling to make it easy and fun to use :0

<!-- more -->

---

**[Phantasm](https://github.com/lynnpepin/phantasm)** is a fantasy assembly language and interpreter, written in Rust. It's incomplete and rough, and I'm abandoning it for now. It features a custom [dynamic Number type](https://github.com/lynnpepin/phantasm/blob/main/src/number.rs). The small remaining tasks to the core interpreter are to create a CLI, preprocess jump labels, and rework how arrays are indexed. In the larger scope, I'd like to add strings and pointers/references, create an in-browser IDE, add graphical output, and rework `Number` to type between [arbitrary precision values.](https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic)

---

[**My Rust implementation of Reso**](https://github.com/lynnpepin/reso-rust) is going very nicely. I reworked the compilation and iteration algorithm to be more performant, avoiding the use of hash maps (as I made heavy use of `dicts` in the [Python original implementation](https://github.com/lynnpepin/reso).) It will be running by Christmas, and future goals are to have a nice example processor, parallelization, and a WASM "IDE". I'd love to be able to compile a Reso circuit to an executable that could be run directly on embedded hardware, but that's a ways away.

[As part of the new compiler in Rust Reso, the "region_map_from_reselboard" implements a version of the Connected Component Labeling algorithm.](https://github.com/lynnpepin/reso-rust/blob/main/src/regionmap.rs) As far as I can know, this isn't generically implemented in Rust. This was the gnarliest bit of code. I don't have the skills to make this a generic method that's available on `crates.io`, but... Once it is, I'll post about it?

I've also been working on **an untitled 5-space 2-time dimension puzzler.** There are many issues with multiple time dimensions, [explored in this paper "Physics with Two Time Dimensions"](https://arxiv.org/pdf/1001.2485.pdf). Specifically, with time dimensions $t,s$, a naive implementation of classical rules results in a world where dynamics depend on the path taken from $(0,0)$ to $(t,s)$. If a player does not interact with the world, then the path they take  to a given $(t,s)$ should not matter.

This can be solved by modeling the entire world as a dynamic system (i.e. rules written using ordinary differential equations over integer $(t,s)$ and $(x,y,z,u,v)$ coordinates), but I *haven't found a way to do this that can feasibly be fun.* So instead, I'm writing it as a world where the state at $(t,s)$ *does* depend on the player's observed path from $(0,0)$ to $(t,s)$.

There's not any difficulty from the space dimension, btw. Any arbitrary integer amount of spacial dimensions is dead-easy to work with if you're playing with discrete tiles (i.e. on a grid). Look at 3D or 4D tic-tac-toe, which uses 4x4x4 and 5x5x5x5 grids, respectively. The only question is how to render it.

---

I've also been working on a small collection of [**arbitration opt-out templates**](https://github.com/lynnpepin/arbitration-opt-out-templates). Most Terms of Services nowadays in the US have forced arbitration clauses, class-action waivers, etc. My opinion is that those are evil and should not be legal. But they are.

This project has very little code, it's really just templates + context. 

---

For Christmas, I've been preparing a **Commodore64 emulator** on a Raspberry Pi 400 for my mother in law. This is pretty much a straight shot following of [this RetroCombs project](https://retrocombs.com/combianpi400-1). I found a [lode](https://en.wiktionary.org/wiki/lode) of Commodore .nib files, which required [some compilation and tooling](https://github.com/markusC64/nibtools) to get working on the VICE emulator.

---

**Variable hamming weight hash:** Years ago, during a course project during my PhD work, I came up with a proposal for an extra-evil cryptocurrency, which existed to offer bounties for cracking password hashes. Like traditional Bitcoin Proof-of-Work, you can roughly adjust the difficulty level, but only by a bit mask (meaning it has far less fidelity than Bitcoin's PoW protocol). The idea was to offer a primitive, *built on other password-hashing primitives*, that awarded people if their hash cracked the password or matched a mask.

But to control the difficulty, the mask needed a variable hamming weight (i.e. a controllable number of bits which are on.) I.e. Instead of $hash(x)$ with digest size $N$, you have $hash(x;k)$ with $0 \leq k \leq N$. I got stuck on the security definition (because it's substantially less preimage resistance, especially for $k$ near $0$ or $N$) and my only proposed implementations had variable runtime (making it insuitable for real-world cryptography, which would require a constant runtime.)

I don't intend to create the cryptocurrency (ewww), but I would love to finally formalize this hash idea and get it out of my head.

---

**In other news,** I've been looking to resurrect + open source my [Gyms](https://gymnasium.farama.org/) for [CARLA](https://carla.org/), [RTDS](https://www.rtds.com/) and [OpenDSS](https://sourceforge.net/projects/electricdss/). I made these during my PhD research at the University of Connecticut, doing work on both connected autonomous vehicles and power grid attacks. This is pretty low priority for me, and it'd take a lot of work to get it up to my standards. Email me if these interest you, because right now the "open sourcing" part will be slow. (It'd be a whole thing-- getting in contact with my own university, figuring out a license, etc.)

In my day job, I'm primarily doing "full-stack" development: C# and Go for backend services, Angular + the usual for frontend work, and a touch of AWS. I'm also the go-to analysis person for datascience work.