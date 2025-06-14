

+++
title = "Looking back on a productive 2024"
date = 2024-12-31

[taxonomies]
tags = ["post", "blog"]
+++


Whew, 2024 was quite a year. This was a year where I had a surplus of free time. I twiddled away on Blender projects, I picked up photography and guitar, I made a new friend, and *Sonic the Hedgehog 3* released, which was maybe the highlight of my year.

But this is a *devblog*, so, much as I'd love to, this won't be a *Sonic the Hedgehog 3* blogpost.

In my day job, I'm still just doing fullstack dev: Docker, Postgres, C#/.NET, TypeScript, Angular, some Python, and a teensy bit of Go and Rust. It's all proprietary, so I can't tell you more here. Womp womp.

But I got *a lot* done in 2024. 

<!-- more -->

**In January**, I finished up my late-2023 project, rewriting **Reso in Rust**, which I wrote about [here](https://lynndotpy.dev/posts/reso-2023/). [It has a dinky website](https://resolang.dev/) made using [axo.dev's Oranda](https://opensource.axo.dev/oranda/) and [a swanky GitHub org](https://github.com/resolang/reso)! I can highly recommend [axo.dev's `cargo-dist`](https://opensource.axo.dev/cargo-dist/), which makes GitHub releases very very easy. Reso now has [over 5000 downloads on crates.io](https://crates.io/crates/reso)!

After Reso rust, I promptly started working on [**Genuary**](https://genuary.art/2024/), a daily-procedural-art project. [You can see my work for Genuary2024 here](https://github.com/lynnpepin/genuary), mostly done in Rust using the excellent [nannou](https://nannou.cc/) framework. This year, I'm doing Genuary2025, but making small *Bevy* games instead.

**In February**, while catching up on Genuary, I also made a *tiny* contribution to Oranda, mentioned above, which felt *fantastic*. But I stopped work for a more important project, **data analysis in support of New Haven's Rosette tiny-homes**. I did data-work involving analysis and plotting of SeeClickFix data. We were happily surprised to see the homes granted zoning relief (i.e. approval) for six tiny-homes in New Haven, CT, which were providing shelter for otherwise unhoused people. You can read about the win [here](https://www.newhavenindependent.org/article/unhoused_get_relief_from_zoning) and [here](https://www.nhregister.com/news/article/rosette-street-prefab-shelters-new-haven-18958450.php). 

**In March,** I worked on and published [this small security analysis](https://lynndotpy.dev/posts/boycott-app-security/) of three BDS boycott apps. I use boycat regularly despite its unnecessary and overly-broad terms, but Boycott for Peace is a close second. I *can not recommend "NoThanks"*, for its many embedded adware trackers. During this time, I also worked on an (unfinished) Halo fangame called "RingBearer Zero". But I decided to shift my focus to learning Bevy instead. During this time, I also wrote a [a USB mouse wiggler](https://lynndotpy.dev/posts/mouse-wiggler-python/) and I set up a [Jellyfin server](https://jellyfin.org/) for my friends.  

**In April**, I'd done a few small things. I trialed [plasticity.xyz](https://plasticity.xyz), having had used SolidWorks and Autodesk Inventor for CAD as a highschooler, and found it a formidable, cost-effective, and Linux-supported alternative. I raised awareness of and got [MonsterMannen's once-good now-malware Reddit extension off the Chrome extension store](https://old.reddit.com/r/Enhancement/comments/1cyh6d7/not_res_but_an_extension_popular_here_the_reddit/) after seeing it request permissions for every webpage. I also [continued to update and accept PRs from my arbitration opt-out template repo](https://github.com/lynnpepin/arbitration-opt-out-templates/).

**In May,** I mostly spent it on life errands, mostly wrapping up my PhD work and leaving with a masters, and working on small Godot projects.  I started [a Godot Tower Defense project](https://github.com/lynnpepin/genericdefense2). It's very very minimal. 

**In June,** I was also able to **save a small-web community from disappearing!** I saved a [postmill.xyz](https://postmill.xyz/) instance, migrating it to a VPS and taking over as sysadmin after a failed Heroku migration killed the site. Having had been burned by dependency issues with PHP in the past (grrr Nextcloud!) I opted to learn and use **Docker** for this work. It required a lot of fiddling, database migration work, and bugfixing. I'm happy I was able to contribute back to Postmill, but I'm even prouder I was able to use my Linux skills and [save the day](https://xkcd.com/208/).

**In July**, I started work on [contributing to the Helix editor](https://helix-editor.com/), which I love. I wanted to add mouse support to support clicking on bufferline, and while I was unable to finish it, I compiled my notes and [I'm excited to see `irh` has created a PR which adds this feature!](https://github.com/helix-editor/helix/issues/4942) I also fixed the pagination on my personal blog, which I messed up in Zola.

**In August,** I started working on a light mode for Bevy's website. You can [see my fork here](https://github.com/lynnpepin/bevy-website), the [relevant PR / discussion here](https://github.com/bevyengine/bevy-website/pull/1603), and [`doup`'s open PR here](https://github.com/bevyengine/bevy-website/pull/1771). The dark-mode-only documentation made it difficult for me to learn Bevy in the daytime. I implemented a fork using `media: prefers-color-scheme`, but ultimately, the team wanted this to be implemented with a JavaScript toggle on top of that, so as to prefer the default dark. I wasn't able to hack that together in a timely manner, and other people took up the work. As of this writing, the light mode is still a WIP!

Oh, I also made [a few music SVGs for study.](https://github.com/lynnpepin/music_svgs) I drew them by writing the SVGs in Helix :) And I got accepted onto [lobste.rs](https://lobste.rs), which was nice, as I was a long-time lurker.

**In September and October,** I had some life disruptions. Meloncube had a failed migration which ruined the Minecraft server I run, and I promptly moved off of them. (Among other things, they removed the whitelist and broke backups, and griefers immediately took over.) I spent more time on Bevy light mode.

**In November,** I started on a fork of the Obsidian plugin [spaced repetition](https://github.com/st3v3nmw/obsidian-spaced-repetition/), i.e. flashcards, to add a feature I thought was missing: *Reshuffle*. When I use flashcards and I miss one, I like to reshuffle into the back of the deck, making sure I answer it correctly at least once. The plugin lacks this feature. This is still a work-in-progress, but would greatly improve the usefulness of the plugin for me.

**In December,** I also started working on [Genuary](https://genuary.art) for 2025, with the goal of getting a simple Bevy-to-wasm export set up. While Genuary is about  [You can see the fruit of that labor here!](https://genuary2025.lynndotpy.dev/20241219/) As well as [the first day of genuary](https://genuary2025.lynndotpy.dev/01/).

I also got myself my first proper, mirrorless camera, a Sony Alpha a6400. I spent some quality time with that camera this month. :)


