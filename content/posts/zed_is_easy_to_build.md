

+++
title = "Zed is easy to build which makes me happy"
date = 2025-01-09

[taxonomies]
tags = ["post", "rust"]
+++

**tldr**: I have very low trust in Microsoft and their products. I am in the market for a GUI code editor to recommend and use in lieu of VS Code. I've used Atom, KATE, Lapce, VS Code, and VS Codium. 

At a minimum, I want something that is open source and easy to build. Zed was annoying to build on MacOS because of Xcode, but **Zed was effortless to build on Linux!** This makes me think Zed would be less likely to be able to do a successful rugpull. (Plus, Zed does not have the same market position as Microsoft).

Zed is familiar and good and it's easy to disable all the AI features with one toggle.

As a note: This is one of the things I really love about Rust. The only painful thing about the build was that it took awhile to bake. But I had no debugging steps or effort to do when building Zed (on Linux).

<!-- more -->

# Microsoft products considered harmful

> **tldr**: Microsoft bought GitHub and started ruining it in 2022. It's gotten worse every year since. We've also seen Microsoft Windows and Office get worse. So, I do not want to use VS Code.
> 
> I've used a number of text editors. I like Helix and Gedit but VS Code has been the default recommendation for a GUI editor since about 2016. I would like a GUI editor and Zed is an appealing option, but I am worried about a rugpull. So, I will try to build it as the first part of my evaluation. 

In the Vista years, Linux nerds online told me I should check out "Linux". I was a small child at the time, but I was pretty amazed at how much quicker the GIMP loaded, how much faster browsers were (Chrome and Firefox only had 64 bit builds at the time), and once Minecraft released, I found Windows too heavy to play it on while I was able to achieve a comfortable 20 fps on Ubuntu.

I was sad to leave behind the very cool Windows Vista orb, but Linux did one better by giving me multiple desktops I could put in a cube and light on fire. That was very cool.

For years, I used to do the majority of my programming in Gedit, GNOME's text-editor with some nice programming features like syntax highlighting, tabs, and line numbers, but nothing else. This was suitable up to a few ~KLoC in languages I knew well, but I became dependent on nice features like LSP.

I came to love the [Helix editor](https://helix-editor.com/) quite a bit, but I became dependent on VS Code at my previous employer for its superior C# support. (The C# LSP Roslyn just didn't cut it, and the VS Code specific C# extension helped me out on the very large C# codebases I worked on.)

But if you're one of the dozen of readers of this blog, you probably already know it's existentially risky to be dependent on a product owned by Microsoft. VS Code users are mice nibbling at cheese on a spring-loaded trap. Microsoft does what Microsoft does, and I don't want my neck in the way when Microsoft sends the bar down. Just look at GitHub: We found out that the law does not matter after Microsoft gobbled up every line of *our* painstakingly written code, and then as a second "fuck you" Microsoft made GitHub increasingly worse, releasing a [new search](https://github.blog/engineering/architecture-optimization/the-technology-behind-githubs-new-code-search/) which anecdotally (including in my experience) [became much worse](https://news.ycombinator.com/item?id=3514425 which now [blocks users who are not signed in](https://news.ycombinator.com/item?id=39322838) and [failing to surface simple string matches](https://news.ycombinator.com/item?id=35741608), while replacing the instantaneous server-side rendered HTML with a slower and [React-based frontend](https://news.ycombinator.com/item?id=33576722), while also [significantly increasing pricing](https://github.blog/changelog/2025-12-16-coming-soon-simpler-pricing-and-a-better-experience-for-github-actions/). This isn't an exhaustive list of what's gone wrong with GitHub since Microsoft acquired GitHub in 2018.

The point is that Microsoft has done a huge amount of damage to the developer experience in their (not yet complete) task of hollowing out what was once great about GitHub.

But VS Code is also owned by Microsoft, and using it feels like being a mouse seeking cheese from a spring loaded trap. Microsoft has an incentive to increase user dependency to a point where it can be abused, and a long history of it. But sometimes, I want a GUI editor.

VS Code is also an electron app, much like its predecessor Atom. Alternatives today include Atom fork [Pulsar](https://pulsar-edit.dev/) and and Rust-based [Lapce](https://lap.dev/lapce/), as well as KDE's [Kate](https://kate-editor.org/) editor. 

> (aside) I'm in a minority in that I think Electron apps are actually *good*. Electron apps usually mean they work cross-platform with minimal effort, and many thousands of lifetimes of effort have gone into making web interfaces accessible and into making the Javascript engine fast.

The [Zed](https://zed.dev/) editor is one I've been aware of but hadn't used yet. It interests me for the following reasons:

1. It's written in Rust. It may be cliche, but I actually do very much value speed and security in my editors. And since I know Rust, I anticipate it being very hackable.
2. It's open source! Zed does not have the spread that Microsoft does to do the same rugpull.
3. I really, *really* want an editor I can recommend to my non-programmer friends which is not VS Code.

But its hackability and how useful it being open source is depends on how easy it is to build. For *most* Rust projects, it's a simple `cargo run` to build and run the project. So, in addition to the usual "is this a good tool for editing code", I want to check at least 

1. Is Zed easy to build?
2. But also, is it easy for an end-user to disable all the AI stuff? (Especially relevant when recommending a GUI editor for my non-programmer friends!)

So, **for Zed to be something I can consider**, I need to be able to build it, and to do so easily.

On MacOS, the Zed editor's provided `.dmg` installer *does not work*, which is not a promising sign. So, my first assessment of Zed will be in building it.

# zed is annoying to build on a Mac, but that's because of xcode

> **tldr**: Building on a Mac sucks because I have to install Xcode (which uses up much of my 512GB space and has other annoyances), because Rust uses a lot of RAM (and my Mac only has 16GB). But it's doable!

Zed's [building for MacOS](https://github.com/zed-industries/zed/blob/main/docs/src/development/macos.md) instructions are pretty discouraging, since they require installing Xcode. The [Windows build instructions](https://github.com/zed-industries/zed/blob/main/docs/src/development/windows.md) are also rather harrowing, but that's not a problem for me.

But [the Linux instructions show me what I like to see](https://github.com/zed-industries/zed/blob/main/docs/src/development/linux.md): [Some required dependencies](https://github.com/zed-industries/zed/blob/main/script/linux) alongside Rustup, and building is just a `cargo run`. (I prefer when Rust programs require *no* system dependencies, but this is still really straightforward as far as building goes!)

But **building on a Mac kind of sucks**: Being that I am sitting at a cafe and typing on a Mac, I've decided to bite the bullet and install Xcode and build here. **Xcode is the part which sucks**: You need to access [the Apple developer website](https://developer.apple.com/xcode/), apply for a Developer account, wait for access to that, and then download Xcode, which downloads 12GB and installs to about twice that. I already have access to that, though. **After installing Xcode**, you have to configure it further in the CLI:

```sh
xcode-select --install
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license accept
brew install cmake
```


After that, it's a simple process to build and install...

```sh
git clone git@github.com:zed-industries/zed.git
cd zed
cargo run --release
```

But I end up failing on a Metal error and the [troubleshooting steps](https://github.com/zed-industries/zed/blob/main/docs/src/development/macos.md#troubleshooting) lead me to run:

So, I also run this:

```sh
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
xcodebuild -downloadComponent MetalToolchain
```

But this also fails, since it's a universal truth that Xcode is an unwieldy mess which hates you. I also needed to run `xcodebuild -runFirstLaunch` before downloading `MetalToolchain`. 

All combined, this is a combined script to build and run Zed on MacOS:

```sh
brew install cmake

xcode-select --install
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license accept
xcodebuild -runFirstLaunch
xcodebuild -downloadComponent MetalToolchain

git clone git@github.com:zed-industries/zed.git
cd zed

cargo run --release
```

My Mac only has 16GB RAM, so I close out all other applications while this runs. 

# the zed experience

> **tldr**: It's snappy, and has a simple "Disable AI" toggle for those who don't want a single hint of the stuff. But I didn't do much more editing, since I got stuck on a tab switching annoyance.

After using up 70% of my battery, Zed finally compiled and ran! I opened up a Christmas project, Post Clicker, and was immediately impressed by how snappy Zed was. In VS Code, things pop into place bit by bit. In Zed, everything happened in the same frame.

Many of the interface buttons are on the bottom, which lead to annoying interactions invoking the Dock on a Mac. But they're not buttons I expect to use often, and they have keyboard shortcuts in their tooltip.

There was an "Introducing: Claude Code" nag, but it brought me to the interaction button where I could install Extensions. I'd like an automatically-refreshing Web preview for this project (it's pure HTML+CSS+JS), but I could not find one. 

Refreshingly, Zed offers both a settings interface and the ability to edit the underlying json, much like VS Code. Zed's settings has a "Disable AI" tab which purports to "disable all AI features in Zed". Toggling that setting won't, say, remove the "MCP Servers" or "Agent Servers" categories from extensions, but that's reasonable, the only other mention of AI I could find was in the keyboard shortcuts. The "Sign In" button can also be disabled.

I couldn't figure out how to get tabs to behave the way I prefer (like a browser, i.e. cycle by order on screen and not open order) and that made it hard for me to get into a deeper editing workflow. I also couldn't figure out how to reset the keymap to default. Whoops.

My laptop battery now nearing 0%, I decide to pack it up and go home. I hope Zed is not difficult to build on Linux.

# Zed is incredibly easy to build on Linux

Zed was incredibly easy to build on Linux. The installation steps *just work*:

```sh
git clone git@github.com:zed-industries/zed.git
cd zed/script
./linux
./install-wild
cd ..
cargo run --release
```

(The `./install-wild` is optional, but I had no problems with it.)



# I feel good about Zed

So, I'm someone who feels very cautious about VC funding and VC rugpulls. I use Astral's tooling with caution, I use Brave while being ready to jump ship any day, I use TrueNAS while worrying quite a bit about it going proprietary, I use Obsidian (proprietary!) with the hope that the community will be able to create an alternative should the author go haywire.

Zed looks like something I can happily add to that same pile of software I have a tenuous relationship with. That's a good thing!
