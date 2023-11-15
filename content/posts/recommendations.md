+++
title = "Things I can recommend"
date = 2023-09-30

[taxonomies]
tags = ["post"]
+++


> **TLDR:** Here are things I like and can recommend.
> - Pop! OS for a Linux distribution.
> - Blender for 3D graphics.
> - Python or Javascript for those learning programming, but it's complicated.
> - 1password for password managers.
> - Signal for messaging.
> - Obsidian for notetaking.
> - Wirecutter and Rtings for prodcut reviews (to replace Reddit.)
> - OBS for screen recording and streaming.
> - DaVinci Resolve for video editing.
> - micro for an easy-to-use terminal editor... But also vim.
> - Fastmail + IWantMyName for personal email.


I've had friends ask me for recommendations for software. They ask me this because I am a hollow person who has spent too much of my life on the computer. I love when people ask me these questions, because my strong opinions on software are usually otherwise "offputting" and considered a "personality flaw".

All jokes aside, I wanted one place to chronicle recommendations I tend to make. In no particular order, here are some of my favorites.

<!-- more -->

Changelog:

| Date | What changed |
| ---- | ------------ |
| 2023-11-15 | Added `micro` editor and the Fastmail+IWantMyName email combo |

# Best Linux distribution: Pop! OS

[Pop! OS](https://pop.system76.com/) is my favorite Linux distribution. It's based on Ubuntu, so the vast trove of Ubuntu-related support such as the [AskUbuntu StackExchange](https://askubuntu.com/) still applies. Unlike Ubuntu, Pop! OS offers an installation that comes with Nvidia drivers out-of-the-box, and does not distribute snap packages by default. (I've had a lot of pain with snap packages.) Pop! OS also comes with a custom flavor of GNOME with built-in easy-to-use tiling, which I absolutely love.

When my friends ask me what Linux distro I use or what they should start with, I usually tell them Pop! OS.



# Best 3D graphics program: Blender.

[Blender](https://www.blender.org/) is a 3D graphics program with support for modeling, sculpting, arranging scenes, shader materials, rigging and animations, drawing, video-editing and compositing, and more.

It's increasingly used in the industry and it's completely free and open source. Outside of a CAD context, it's the best 3D art program I've used, and plugins like [CAD sketcher](https://www.cadsketcher.com/) make Blender even more comfortable for those coming from tools like Solidworks or Inventor.

Knowing Python gives you even more power inside Blender, but it's not necessary at all.

The interface is demanding and daunting, but this is because manipulating objects in 3D space is a complicated task, and because Blender has built-in support for the litany of different workflows needed for 3D animation.

For anyone who tried Blender before and dropped it, reconsider. In 2019 with its 2.8 release, it got a UI/UX overhaul and a hefty feature refresh. Every few months, [Blender adds several new features](https://en.wikipedia.org/wiki/Blender_(software)#Release_history). It's kind of mind-boggling.

If you're considering Blender, you already know what you need it for. Have faith in the interface, it had a lot of thought and care put into it. It'll all click eventually, and when it does, it'll feel good.


# Best programming languages: It depends, but probably Python or JavaScript.

When someone tells me they want to start programming, I recommend Python or JavaScript, since they're the quickest languages to go from zero to "look at what I made!" with.

I learned Python early on, and I got a lot of benefit from its interactive shell. I'm able to use it as a:
 - Linux shell, using `sys` and `os` and `shutil` for common tasks.
 - Graphing calculator ([Pandas for 'dataframe' tables](https://pandas.pydata.org/), [Numpy for arrays](https://numpy.org/), [matplotlib](https://matplotlib.org/) or [plotly](https://plotly.com/python/) for graphing).
 - Exploring APIs with [requests](https://docs.python-requests.org/en/latest/index.html), replacing Podman or Insomnia by using a Jupyter notebook.
 - Prototyping on embedded computing using [CircuitPython](https://circuitpython.org/) or [MicroPython](https://micropython.org/).
	 - These Python-like languages cost a lot of overhead on embedded hardware. I only use these because I use Python daily.

I also use Python when working with Blender for 3D or [GIMP](https://www.gimp.org/) for 2D.

But... JavaScript can do most of the above, every browser comes with an embedded JavaScript console, and it's so widely-known that it's used in a variety of non-web contexts.

But the answer ultimately **depends on what you want to learn a language for.**
 - Want to make iOS apps? Learn Swift.
 - Android apps? Kotlin.
 - Godot games? GDScript.
 - Godot but coming from Unity? C#.
 - Computer Science degree? Whatever your university teaches.
 - Self-taught CS? C is the closest language to the computational model you'll need to internalize during your degree, but it's not good for new projects.
 - Transgender? Rust or Haskell. (This is a joke, but Rust is great.)
 - Web development? JavaScript (+HTML +CSS +bash)

Python is fantastic combined with [Jupyter Lab](https://jupyter.org/), which lets you run blocks of code interactively, intermixed with notes and diagrams. (Jupyter supports more than just Python, btw. Check it out!)

Whatever you choose, the skills are highly transferable between languages.

# Best password manager: 1password

Everyone should use 2FA and a password manager with long unique passwords for each login. This is an old security prescription that I stand by.

I was studying cryptography when I was considering password managers. After much research, 1password stood out for their use of [the zero-knowledge "secure remote password"](https://support.1password.com/secure-remote-password/) protocol. This makes it very hard to attack and capture passwords in-transit because it gets around the need to send a password through an encrypted channel. Rather than encrypting and sending a message with your password to authenticate to their servers, your client app provides a "proof of knowledge" that you do, indeed, know your password. 1password also wins on basic features: It's cross-platform and has autofill.

1password is priced at $36/year, but you're paying for sync. If your payment lapses, you can still access your passwords on every device you had 1password on. They just won't sync anymore. (This is good-- it means you won't be locked out of your passwords.)

I know there are alternatives out there, like Bitwarden or Keepass. I haven't used either. If 1password goes down the drain, I feel comfortable I can switch.

I vehemently recommend against LastPass, since it had several severe breaches which lead to compromised accounts.

# Best messaging app: Signal

I'll keep this one short, since others have already said what I have to say. Signal has end-to-end encryption on everything, making passive surveillance (e.g. for marketing and analytics) impossible, while also offering a useful chat app. Signal has implemented reactions, stories, and groupchats without compromising on security, and you can verify client keys in-person. (This is important, because it's easy to MITM key exchange.)

The benefit of Signal comes from the network effect. Nobody I know uses Jabber or Matrix or Session or Element, but I have a few dozen Signal contacts. The more people on Signal, the more people you can talk to on Signal, and so less data is casually and unnecessarily exposed.

# Best notetaking: Obsidian

I love Markdown and I've used it for notetaking for years. I've used gedit, vim, VSCode, StackEdit.io, and NextCloud Notes, but they've all had their shortcomings.

Obsidian stands way *way* out among Markdown editors. The team is unrelenting in their pursuit of functionality and user experience. **I can say this without exaggeration: Obsidian changed my life.**

The magic is the plugins system, which is kind of a 2009 "Google Chrome plugins" moment for notetaking. The plugins work on desktop and mobile, which is fantastic.

I've used Obsidian for:

- Personal journaling
- This post
- Short stories
- Writing math (via the [built-in LaTeX support](https://publish.obsidian.md/hub/05+-+Concepts/LaTeX).)
- Software diagrams (via the [Mermaid](https://mermaid.js.org/) [plugin](https://github.com/dartungar/obsidian-mermaid))
- Financial spreadsheets (via the [Advanced Tables](https://github.com/tgrosinger/advanced-tables-obsidian) plugin)

Obsidian is proprietary, but it's backed by the native filesystem with mostly-open formats. If Obsidian gets [enshittified](https://en.wikipedia.org/wiki/Enshittification), *I can just leave*. And if I'm leaving Obsidian, I won't be alone, which means I can rely on (or help make!) community-driven migration tools.

The only thing Obsidian lacks (as of October 2023) is good handwritten notetaking.


# Best handwritten notetaking: Pen and paper, really.

As of October 2023, Obsidian lacks good handwritten notetaking. While [Obsidian's Exclaidraw plugin](https://github.com/zsviczian/obsidian-excalidraw-plugin) is fine in a pinch, I wouldn't use it regularly.

I've tried various notetaking apps on iPads (Apple Notes, GoodNotes, and Bear), but the 264ppi screen density and 60Hz refresh rate is too low for how I write. I've also tried the reMarkable 2 tablet, which gets close to delivering on the promise of being "like paper", but I returned my model for having digitizer issues.

There is just too much benefit in the physicality of paper.

I think part of my issue is because I write with a .5mm pen, at about 6 characters per centimeter. This is smaller than can comfortably be done with digital tablets. I also find that using pen-and-paper for handwritten notes, and then digitizing later, helps me best internalize things.

I keep my TODO lists in pen-and-paper as well, copying over a days unfinished TODOs onto the next. (I find myself doing items I've procrastinated just to avoid the labor of writing them down again!)


# Best product recommendations: *Not Reddit.*

I'm sure I'm not the only one who has a search history with items like "`site:reddit.com best nail clippers`". I've become way too reliant on Reddit for relevant reviews, so I've been amassing alternatives. 

Here are some reviewers and whatnot that I now follow regularly:

 - [New York Times Wirecutter](https://www.nytimes.com/wirecutter/) has great product reviews for almost every category, financed by referral links.
 - [Rtings.com](https://www.rtings.com/) conducts in-depth product tests and reviews. They have transparent and rigorous methods, which they apply across the board when evaluating a class of product (such as monitor or headphones.) Rtings is excellent.
 - [Blender OpenData](https://opendata.blender.org/) specifically for measuring GPU performance in Blender.
 - [Videogamedunkey](https://www.youtube.com/@videogamedunkey) is a videogame reviewer with opinions that overlap with mine. If Dunkey likes a game, I consider it more heavily. But his humor is wrapped in irony and it can make it hard to understand what he's saying in some reviews.
 - [Macrumors](https://www.macrumors.com/) is where I go specifically to find when new Apple product deals hit.
 - [SoftwareRecs StackExchange](https://softwarerecs.stackexchange.com/) is great too. StackExchange is in the process of being AI-enshittified too, but as of October 2023, this is nice.

I once relied on Reddit and its communities for recommendations. In 2023, Reddit killed API access, and communities I follow got absolutely upended. Overnight, r/coffee's community disappeared, subreddits like r/pwned (tracking data breaches and leaks) went offline permanently, and subreddits like r/homeassistant were destroyed when Reddit forcibly replaced the entire moderation team.

The rampant ChatGPT/LLM spam and overwhelming astroturfing has ruined the utility of Reddit. Goodbye, `site:reddit.com`, you adorned my searches well.

# Best screen recording and streaming app: OBS

Roses are red, violets are blue. Unregistered HyperCam 2? I'm leaving you, [for OBS](https://obsproject.com/). When OBS appeared, all other screen recording/streaming software became obsolete.

OBS is a simple and powerful tool for recording or streaming your desktop on Windows, Mac, and Linux. I've gotten lots of happy use out of it. It has native integrations for popular APIs such as Twitch, it's FOSS, and it's easy to use.

It's top-of-class, so much so that [TikTok illegally used the codebase for its own streaming app.](https://www.protocol.com/bulletins/tiktok-obs-gpl-violation)

As a side note: You want [OBS](https://obsproject.com/) and *not* "Streamlabs", a monetized fork which has a prettier interface but with worse performance, a [forced arbitration clause and class action waiver which users cannot opt out of](https://streamlabs.com/terms), a [broad and vague privacy policy that allows them to collect and share users demographic information such as sexual orientation, what files are on their computers, information from contacts including children](https://streamlabs.com/privacy) and more (as the policy is open ended.) Do not use Streamlabs OBS. [You can't sue Streamlabs](https://github.com/lynnpepin/arbitration-opt-out-templates/) when they do you wrong.


# Side note regarding FOSS

A lot of these recommendations are FOSS or FOSS-adjacent, but not all of them. The reason for this is that FOSS skills I've learned *keep paying off* and I have never felt cheated or regretted investing learning a FOSS tool. Enshittification hasn't touched me

I learned Linux around 2010 and I stayed within the FOSS ecosystem because I could not afford other software. I've never had the rug pulled out from me by Adobe (remember the creative cloud controversy?), by Microsoft (remember Windows 8?), by Apple (ever lose an iTunes purchase, or iOS/MacOS features on an update?), or by a software simply losing industry favor. (Remember when Vegas Pro was widely used and popular?)

Because I became an annoying Linux user at the delicate age of 10, I've found myself more employable, and I've found happy professional employment over the years where I was able to use Blender, Godot, Qt, Linux, LaTeX, the works.

But not all the best software is FOSS, which is why not all my recommendations are FOSS, but I do try to only recommend software that is at least cross-platform. If it doesn't have Linux support, I can't seriously consider or recommend it.


# Best video editor: DaVinci Resolve

I've tried a number of FOSS video editors, and [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve) blew my mind.

It's proprietary, but it has a powerful free version, and it's cross platform: Window, MacOS, and Linux. 

For anyone who wishes to stick with FOSS, I've tried a lot of videoeditors and I've found [Kdenlive](https://kdenlive.org/) and Blender's built-in video editor to be the second best I've used.


# Command-line / terminal editors: `micro`, but also learn `vim`

[Micro](https://micro-editor.github.io/) is a terminal editor that's easy to use. It has familiar shortcuts (`ctrl+c`, `ctrl+s`, etc.), mouse support, and syntax highlighting. It's fantastic, and I wholeheartedly recommend it to anyone new to Linux.

That said, I also recommend learning enough vim (or `vi`) to be useful. The reason is that it's pre-installed on every Linux distribution I've heard of, and you don't want to be stuck in a locked-down server with `nano` as your only other option.

There are a lot of very good command-line editors out there. I got good use out of [`helix`](https://helix-editor.com/) and [`neovim`](https://neovim.io/), but I keep finding myself coming back to `vim` and `micro`.

# Personal email: Fastmail + IWantMyName

I use [IWantMyName](https://iwantmyname.com/) for domains and [Fastmail](https://app.fastmail.com/) for emails. With these two, I'm able to have as many `*@*.lynndotpy.xyz` emails as I want.

## Fastmail: $5/mo for everything I need

I chose Fastmail after using ProtonMail and Tutanota for some time. The latter two make a lot of inconvenience as part of their "encrypted email" offering, but I only wanted to move from GMail because I wanted a servicer that doesn't scan my emails for marketing. My threat model doesn't need my emails to be resistant to espionage or subpoenas.

The setup for using custom domains on Fastmail is a bit involved, but that's because I purchased then through IWantMyName rather than through Fastmail.

I also chose Fastmail because it was able to replace a lot of what I used NextCloud for. Fastmail supports CalDAV and CardDAV, which lets me sync my contacts, calendars, and reminders easily across all the major desktop and mobile operating systems. (Yes, even iOS and MacOS!)

## IWantMyName: Good reputation and good ToS

Google Domains was the last thing I used Google for during a whole de-googling journey (which involved a lot of time with Nextcloud). I wanted to move off Google Domains [because of the long list of product lines Google has killed](https://killedbygoogle.com/), which is 293 items long as of this writing and includes Domains! They sold to *SquareSpace*, which I hold to low repute for other reasons.

I read up on a few different domain registrars, and I also read their Terms of Service. (I actually emailed them a correction!) Some things I like about it:

- They actively encourage you to read the ToS on signup
- There is no arbitration clause or similar provision in the ToS.
- The privacy policy is decent.


# Anti-recommendations

Here are some things I would recommend avoiding entirely:

- **Linux "snap" packages will degrade your Linux experience.**. They've been responsible for strange-and-hard to diagnose issues (e.g. OBS) on otherwise nice software, I've had configurations for software break and disappear (e.g. Firefox). The worst thing is that software which once loaded instantly now takes several seconds (e.g. Gnome Calculator), which kills flow. In a world where static linking, AppImages and flatpaks exist, I can't understand Snaps. These are what drove me to Ubuntu.
- **Apple-specific software will embarrass you if you live in an Apple bubble**, especially in a collaborative setting. Nobody except other Apple users can see your Apple Numbers spreadsheets or your Apple Freeform pages. It's especially bad to send these types of files in a professional context. If you're jobhunting and you've been sending your resume as an Apple Pages document and not a PDF, you might have been disqualifying yourself from the start without even knowing it. 
- **iMessage helps Apple profit by excluding poor people (in some markets.)** In the US, iMessage is popular, and Apple profits from class warfare by dividing a line between those who can and those who can not afford an iPhone. [This is purely to sell more iPhones, according to emails from 2013 and 2016 leaked in 2021.](https://www.theverge.com/2021/4/27/22406303/imessage-android-eddy-cue-emails-apple-epic-deposition) This dividing line makes it inconvenient for iPhone users to converse with non-iPhone cellphone owners, especially in the groupchat setting. [This is a serious problem in K-12.](https://www.wsj.com/articles/why-apples-imessage-is-winning-teens-dread-the-green-text-bubble-11641618009) If you own an iPhone with iMessage enabled in the US, you are responsible in part for iMessage-dominance and you are inflicting harm on those who cannot afford it.
- 