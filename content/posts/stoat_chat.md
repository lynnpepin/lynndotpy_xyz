+++
title = "Discord is dying, Stoat looks like the replacement we need"
date = 2026-02-11

[taxonomies]
tags = ["post", "internet", "discord"]

+++
---

> **TLDR**:
> 
> - **Discord is already bad**, but now it's going to require IDs and video selfies.
> - **Stoat looks like the best**. I think it is the ship to jump to.
>     - Of the alternatives, all of them are either proprietary or use LLM-generated code, and a lot of the proprietary ones seem Evil.
>     - If you are concerned about Stoat having had a few small LLM commits, know that **Stoat is the most anti-AI alternative**. 
> - The Stoat LLM controversy is blown out of the water, since (1) Stoat has a very rare anti-AI policy, and (2) almost everything else has AI in it now anyways. You are definitely using software with LLM-generated code in it, directly and indirectly.
> 
> This article goes over the criteria for an alternative, why TeamSpeak, Mumble, etc. aren't up to par, and why the "LLM controversy" about Stoat is ill-informed.


In a few weeks, it will be March, and Discord will require every user to upload their ID or a video-selfie ([The Verge](https://www.theverge.com/tech/875309/discord-age-verification-global-roll-out)), the latter of which will be analyzed using AI, and both of which will be sent to a third party vendor, only months after one of those vendors suffered a data breach. 

This is on top of Discord having a [mandatory arbitration clause and class action waiver](https://lynndotpy.dev/posts/discord-optout-2023/) which prevents you from being able to sue them in court (and, yes, this works in the United States), and this is on top of Discord scanning all your messages to train its AI models.

**Discord has been bad for years and is getting worse, it's time to jump ship**. I've been gaming on The Computer for years, and I've used IRC, Skype, Steam chat, TeamSpeak, Mumble, Ventrilo, and integrated game chats in everything from huge games like RuneScape to tiny long-defunct games like Goomba Online or Halo Crusades. I'm also a cybersecurity person, software engineer, and deep learning researcher who left in 2022 as I started to sour on the industry.

Having had looked at the alternatives, I believe **Stoat is the ship to jump to**. But it [is facing some backlash over having had a few small LLM commits](https://github.com/orgs/stoatchat/discussions/1022), which I believe is disproportionate.

A good alternative should be:

0. **User friendly**. It should be easy for someone to start using this software on MacOS, Linux, Windows, Android, iOS, or in the web app. This is a minimum.

1. **Open source**, both so we can jump ship if things turn to shit, but also so we can *look at the code*. This is increasingly important in an era of vibe-coded. You can **assume anything proprietary is vibe coded**.

2. **Not vibe coded**. There's a difference between code that was created in part using LLMs, and someone lazily asking a chatbot to change a feature. Lots of bad software is being made by vibe coding, and some of them are crazy people who believe vibe-coding is a way to birth God. That's, uh, 

3. **LLM guidelines that emphasize transparency and quality**. As I'll argue later, *LLM generated code is everywhere now*. There is no way to discern LLM generated code from human generated code, and the only option is to **hold code to a high standard in review**. A contribution policy can never ban LLM generated code, it can only ban people from disclosing when they use LLM generated code. In the interest of quality and transparency, Forgejo's [AI Agreement](https://codeberg.org/forgejo/governance/src/branch/main/AIAgreement.md) is a reasonable one.

4. **Privacy friendly**. What's *far far worse* than having LLM generated code is having a privacy policy that *sends all your messages to an AI model*. You should rather take a privacy-friendly vibe-coded app with code you can inspect, versus something like TeamSpeak, which is proprietary and sends your data to train Grok


5. **No mandatory arbitration clause**: This is a huge thing. It's increasingly common to include a section in the Terms of Service which requires users to agree *never to sue the company*. In the United States, these are almost always upheld, even in extreme cases.

<!-- more -->

> **Disclosure** - **No AI was used here**. Not in writing this post, not making this website, and not in hosting this website. I don't even use a spellchecker. But I do write a lot of lists and formatting because I love lists and formatting.
> 
> I write **long posts**, so I use generous TLDRs and **bold formatting** to make it easier to read and see the main points. I use headers-as-summaries, so a table-of-contents would suffice as a summary. 
> 
> If you're using an "AI detector", then you're using AI. Email me and let me know what your AI thinks of my hand-typed post. Anyways, here are a bunch of em dashes: — — — — — — — — — — — — — — — 


# The alternatives to Discord

This is what the article is about, so let's get into it:

|                           | Stoat        | Discord | TeamSpeak    | Mumble       | Matrix      | Ventrilo        | RootApp |
| ------------------------- | ------------ | ------- | ------------ | ------------ | ----------- | --------------- | ------- |
| User friendly             | ✅            | ✅       | ¯\\\_(ツ)\_/¯ | Kind of      | 🚫          | 🚫              | 🚫      |
| Open source               | ✅            | 🚫      | 🚫           | ✅            | ✅           | 🚫              | 🚫      |
| Low- or no-LLM code       | ✅            | 🚫      | 🚫           | 🚫           | 🚫          | Uncertain       | 🚫      |
| Reasonable LLM guidelines | ✅ prohibited | 🚫      | 🚫           | 🚫 No policy | ✅ (Forgejo) | 🚫              | 🚫      |
| Privacy friendly          | ✅            | 🚫      | 🚫           | ✅            | ✅           | 🚫 No SSL no PP | 🚫      |
| No arbitration clause?    | ✅            | 🚫      | ✅            | ✅            | ✅           | N/A no ToS      | 🚫      |

**Stoat** hits all the boxes. It's open source, has the strongest anti-AI stance I can find (and I don't even mind LLM-generated code that much), and the devs publicly prostrated themselves removing the few LLM-generated bits of code they had. Stoat has a good user experience, can be self hosted (for being open source), and is built with privacy and whatnot in mind. They even operate a main instance.

I even spent some time looking into the public profiles of the main devs. One of the main devs of Stoat is queer, [explicitly antifascist](https://vale.rocks/), and has [impassioned pro-accessibility writing](https://vale.rocks/posts/accessibility-importance)with other devs who [fought off Andrew Tate's abusive advances and won](https://insrt.uk/post/andrew-tate-stealing-software-revolt) as a teenager. The Stoat devs are very cool, actually.

**Discord** trains its AI models on all of your messages and calls, will be requiring an ID or video selfie, and you can't sue them on the matter. Not much to say here- you're probably here because we all are angry at Discord.

**TeamSpeak** is proprietary and [just as bad for privacy](https://www.teamspeak.com/en/privacy-and-terms/). They send data to Elon Musk's X Analytics and Ads (i.e. Grok), to Meta (which, among other things, is responsible for the Rohingya genocide in Myanmar), Google (which is explicitly pro-ICE), and others. Surprisingly, they don't currently have an arbitration clause.

It's safe to assume TeamSpeak and all other proprietary options are using LLM generated code.

(Something concerning is they state they "double hash" passwords, but they don't describe what hash, or if they're using PBKDF, etc. This is just a small security detail, but TeamSpeak is not open source, so I can't verify they're storing passwords reasonably. But I *can* verify Stoat is using [rust-authifier]([https://github.com/insertish/rauth](https://github.com/stoatchat/rust-authifier))  which uses argon2 which is a reasonable KDF for password hashing.)

I haven't used TeamSpeak since ~2010s, so I won't speak to its user friendliness.

**Mumble** is open source and something I've had good experiences with in the past. But, it lacks the features to be a true Discord replacement, requires self hosting, and has no web app.

Further, [it contains many commits with `claude` as a co-author](https://github.com/mumble-voip/mumble/commits/master/), meaning Mumble is partially LLM-generated. It also lacks an LLM policy delineating guidelines and expectations for LLM contributions.

**Matrix** is open source and something I've used for years. Unfortunately, it's full of friction and rough edges and it's really hard to recommend as a replacement for Discord. It does have LLM-generated commits, but it [adheres to Foregjo's policy](https://github.com/matrix-org/matrix-rust-sdk/blob/main/CONTRIBUTING.md). The main client, Element, is also a killer on my laptop battery :(

Matrix does have a benefit of being the only fully E2EE app here. I think this doesn't matter *as much* for something Discord shaped, since it emphasizes large open chatrooms, which negates the point of E2EE. 

**Ventrilo** should not even be in the running. It can't be used by everyone who uses Discord, since it does not have a web app, a mobile app, or a Linux app. It's proprietary software, and the only reason it might not have LLM generated code is that it has not been updated since 2023. Ventrilo's site and downloads are not protected with SSL, Ventrilo uses *telnet* for communication, and there is no apparent Terms of Service or Privacy Policy. Nobody should ever consider Ventrilo as an alternative.

**RootApp** is user unfriendly for not having a web app, which makes it non-viable as a Discord replacement. The ToS [has a mandatory arbitration clause and class action waiver](https://www.rootapp.com/terms-of-use). The Privacy Policy is [full of the usual stuff](https://www.rootapp.com/privacy-policy), and privacy unfriendly compared to the open source alternatives.

There are a few others that exist, but I did not go into here. **Sharkord** I did not consider since it is in an alpha state. I wish the project the best of luck, but it's not ready yet. **Guilded** is not in the running since it no longer exists. **IRC** is not in the running because it lacks images, stickers, emojis, reactions, voice chats, video calls, screen sharing, game integration, persistent chat history, server moderation, or profile information. I love IRC, but it's not an option.




# Sorry to say, but LLM generated code is everywhere. You can't avoid it.

> **tldr tldr**: LLM generated code is unavoidable. I'm sad about it too. It's kind of like microplastics.

> **tldr**: If you're someone who wants to avoid using anything with LLM generated code, I am sorry to be the one to tell you that you have probably failed:
> 
> - LLM generated code is in every Android, every iPhone, every Chromebook and Macbook and Windows laptop, and even Linux. It is in Google Chrome and Firefox and Safari and their derivatives.
> - For those from BlueSky, both BlueSky and Blacksky have LLM generated code.
> - Algorithmic feeds are AI, and that includes YouTube, TikTok, Instagram, YouTube, Snapchat, Facebook. People on these sites are AI users.
> 
> If you are daily-driving an OS and browser you believe is free from LLM generated code, please email me, I want to hear about it.

There are some people who want to use absolutely zero LLM generated code. This is an untenable position. So, if that is you, I am addressing you here:

If you're here from BlueSky: The BlueSky app has [commits created with Claude](https://github.com/bluesky-social/social-app/commits/main/). The BlackSky fork [contains these commits](https://github.com/blacksky-algorithms/blacksky.community). 

Google, Windows, and Apple are proudly using LLM-generated code. [Linux has guidelines for contributions by AI coding assistants](https://github.com/torvalds/linux/blob/master/Documentation/process/coding-assistants.rst) that are even more permissive than the [Forgejo ones](https://codeberg.org/forgejo/governance/src/branch/main/AIAgreement.md). You can't even turn off the language model on the iOS keyboard which invisibly resizes the keys as you type- *every text written on an iPhone is partially AI assisted*. 

Google Chrome, Firefox, and Safari use LLM generated code, and so do their derivatives.

If you're using an algorithmic feed, then you're consuming AI generated content every day. Even if the videos aren't AI, they're still curated using AI. Get off YouTube, TikTok, Instagram Reels, Snapchat, X dot com, Facebook, and others. (X is also a site for nazis and pedophiles, and the people who are okay with them, so you should especially get off that.)

And there's also the case of code fuzzing, or automated vulnerability discovery. This has been a thing for decades, long before the Transformer architecture arrived in 2017. Even if a project has the most stringent anti-AI stance, a developer should still fix vulnerabilities even if they're uncovered by an LLM.

I write this site by hand, but I'm drafting this post on Obsidian, on an Apple Macbook and Linux dekstop (interchangably), using the Zola static site generator, posting to a site hosted on a DigitalOcean VPS running Linux, communicating with at least a few AS's along the way. At least *some* of these have LLM generated code in it.

LLM generated code is unavoidable. **It didn't have to be this way, but it is**.

So, **[Stoat is an increasingly rare outlier](https://github.com/orgs/stoatchat/discussions/1022) in having a no-LLM stance**. (Again, I think a stringent policy is better for transparency, but whatever). They are **still facing bullying and backlash**. Here are some quotes which I will disagree with.

# The Stoat controversy is far, far overblown

> **tldr**: Stoat has a no-AI policy, which puts it ahead of every other Discord alternative. They have also removed the already small LLM generated code.
> 
> I think purity tests are bad. This really just smells like FUD, that only benefits Discord as it scrambles to maintain dominance.

I'm not trying to put people "on blast", but I think some of these positions are so extreme that they might be inauthentic FUD, and I think it's important for me to attribute who I am quoting. In case this blows up, please don't harass these randos, we all have a lot of strong feelings on the matter.

I can't reply to the GitHub thread, as it is closed now, so I am replying here.

---

> > **GitHub user [Fluffies-System](https://github.com/Fluffies-System)**:
> hey uh, here is a pretty big one:  https://github.com/stoatchat/stoat.chat/blob/dc114f0163994ed2bce54b302dcb03e3a6ce52b4/src/content/blog/long-live-stoat.md
>
> if you tell us that blog post isn't AI generated we absolutely won't believe you. it makes us question what else was written using AI that didn't have claude marked as a contributor. we agree with another commenter suggesting yall should have a policy banning usage of AI code

The above is unnecessarily hostile, and just completely wrong. There's nothing about the blog post which screams "AI generated", other than having lists, formatting, and emojis.  Unlike AI-generated text, the blogpost is information-dense, well written, and every single word seems intentional.



---

> > **GitHub user [VaelophisNyx](https://github.com/VaelophisNyx)**:
> 
 Using 0% slop code is the only way. Hard stop, no nuance or wiggle room.

I have the same wishes, but, this is an untenable stance that we've already failed on since we're on GitHub.

Stoat *already has a no-AI policy* and has removed AI generated code, but I still argue that a better policy is one that promotes transparency.

---

Onto BlueSky, things are worse, since it's a platform where people are not necessarily platforms, and they can only express thoughts that fit inside the limits of 300 characters.

There are a number of replies expressing this sentiment. I pick just one user here who appears relatively anonymous, and whose account is not full of cartoon porn:

> > [samsonsilvo.bsky.social](https://bsky.app/profile/did:plc:3xhb5zfwic3kws6lbfjz4gu3):
> I still don't trust them since they had the audacity to use AI in the first place. Absolutely zero tolerance.

This is something which *feels* inauthentic. Again, Stoat has no-LLM generated code and a no-AI policy. Users are on a platform that has LLM generated code.

Stoat seems like the best alternative, but is disproportionately seeing a lot of criticism. Even zero lines of LLM generated code is too much.

This has all the elements of a successful FUD campaign.


# that's so many words. can you just tell me what to do

1. don't be mean to the stoat devs. they haven't done anything wrong
2. i think stoat is the best. use stoat. maybe matrix.
3. stoat devs are seeing a huge increase in daily users. give them a chance.
4. i put a lot of time and energy into this article, pls share it if you think it's useful




