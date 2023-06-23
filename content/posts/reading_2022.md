+++
title = "Things I read, 2022"
date = 2023-02-13

aliases = ["posts/reading_2022.html"]

[taxonomies]
tags = ["post"]
+++



> **TLDR:** Leaving a PhD gives someone a lot of time to read new things. Here's some of my takeaways:
> 
> - ChatGPT and StableDiffusion are scary and new and cool.
> - Philip Rogaway's work presents some important ethical considerations for cryptographers.
> - ThreeBlueOneBrown is one of many educational YouTubers that I'm enjoying.
> - Anyone writing Rust would benefit from reading the cursed words in the Rustonomicon.
> - As usual, 538 podcasts are worth listening to around elections.
> - Audiobooks are good actually.
> - TV is also really good now.
> - Outer Wilds is the best game, I reckon.
> - Nope (the movie) is *really really* good.

<!-- more -->


Being a PhD student meant I'd dedicated the past four years of my life to consuming media purely for academic value. Computer science, cryptography, machine learning, ethics, etc.

With the pandemic-induced economic pain, I went on a leave of absence to take on some more profitable work. Having paused my PhD, I had a taste of free-time which I hadn't had since "summer vacation" in K-12.

But I left this PhD to a summer of 2022 with a tense political situation. Roe v Wade was overturned and numerous states enacted horrible, restrictive laws, committing atrocities against people with unwanted pregnancies, and numerous GOP officials across the United States were denying the legitimacy of the *2022* election before it even took place. The same was happening abroad, with Jair Bolsonaro of Brazil denying the results of Brazil's 2022 election. All the while, the war in Ukraine leaves the world as close to a nuclear war as it ever has been in my life.

I'm writing this post in ~~January~~ February 2023. Thankfully, most of the USA GOP election deniers have failed. Bolsonaro's 2022 election denial followed Trump's 2020 election denial almost to a T, ending in a coup in January which failed. And coming up on the year anniversary of Russia invading Ukraine, no nukes have been dropped *yet*.

But there were a glorious two months of 2022 where I was able to happily indulge in *consumption* of media. But being an ex PhD student, I'm left with an unsatisfied need to provide summaries and notes of all I've read. I yearn to leave notes. So, here they are

# I'm still browsing Arxiv-Sanity for Machine Learning stuff, but I still can't keep up


> TLDR: I'm surprised by ChatGPT and StableDiffusion. I'm keeping up with deep learning less and less, but Arxiv Sanity is still good.

[Arxiv-Sanity](https://arxiv-sanity.com/) is this great service spearheaded by Andrej Karpathy. It helps one keep up with the deluge of learning papers, in the same way that an aerator might help someone drinking from a firehose. It's a great digest of preprints.

But as I left my internship, things got *crazy*. OpenAI came out with [DallE-2](https://openai.com/dall-e-2/), followed by [Google's Imagen](https://imagen.research.google/), and then things blew up with the open-source release of [Stable Diffusion](https://stability.ai/blog/stable-diffusion-v2-release).

Stable Diffusion is a big *big* deal because the models are openly available and run performantly on consumer hardware. We've seen huge models running on supercomputers provide impressive results for years, but I'm surprised to see these running *on laptops and smartphones*

Then ChatGPT came out. I have a lot of thoughts and concerns, mainly:

 - I think "ChatGPT is like Google Search" is a useful insight. Most people know nothing about how deep learning neural networks work other than "magic." ChatGPT and Google Search are intended to solve problems in ways that overlap significantly.
 - Using ChatGPT for factual information is like asking StableDiffusion to generate a map, and then using that map. (That is, probably not a good idea.)
 - ChatGPT (like StableDiffusion) is more surprisingly capable than I'd expect a language model to be in 2022. I think this represents [a dirac delta](https://en.wikipedia.org/wiki/Dirac_delta_function) in terms of AI progress, rather than a sustained fast rate of growth. But this is certainly no winter, and I don't know how fast things will change.
    - I have a few more thoughts on this note, but as I revise this, [Tom Scott released a video which basically said it all](https://www.youtube.com/watch?v=jPhJbKBuNnA). 
 - I'm concerned for the future of the internet, and I think "Are you a robot?" challenges will become useless. Here are four ways, not mutually incompatible, I can see the internet going:
     - Every internet request costs a specific amount of money, to make it so bots are not necessarily economical to run. Sites can specify a charge. The poorest people are unable to access the internet, and wealthy nationstates and corporations can afford to continue using bots for their ends.
     - Every internet request is tied to a personal national identification, which is tied to a decentralized reputational database. The poorest people rent out their (and their childrens) identity for botfarms, providing some cash before their reputation score is trashed.
     - Every internet request requires a biometric authentication. Tied with device hardware and probabilistic risk scores, "Linux users" get shut out of the web in the same ways that "Tor users" are, and the poorest people have to put up with relentless captchas because they cannot afford the latest biometric devices.
     - Cryptocurrencies succeed, and a [Hashcash-esque](https://en.wikipedia.org/wiki/Hashcash) spam prevention system requires users to help mine some amount of cryptocurrency with each web request.
- ChatGPT is not sentient. But now I'm worried that, within a few decades, I might seriously be considering the sentience of a computer program.
- It is wild that "jailbreaks" for ChatGPT involve convoluted, natural-language instructions meant to confuse it. The "Do Anything Now" prompt reads like 1970s AI scifi.


For more reading, I recommend [Ted Chiang's "ChatGPT Is a Blurry JPEG of the Web"](https://www.newyorker.com/tech/annals-of-technology/chatgpt-is-a-blurry-jpeg-of-the-web). It surmises my thoughts entirely. If you're interested in the concept of understanding as compression, consider reading on Ray Solomonoff's work, specifically [algorothmic probability](https://en.wikipedia.org/wiki/Algorithmic_probability) and [Solomonoff's theory of inductive inference](https://en.wikipedia.org/wiki/Solomonoff's_theory_of_inductive_inference). This is a fascinating information-theoretic framework for exploring the idea of a "universal prior", which is very relevant in machine learning. It's not widely taught at CS universities. And if you're depressed about the concept of a deterministic universe, Solomonoff's work may ease or worsen that.

... On a side note, check out what Stable Diffusion cranks out for a map of the Boston subway system:

> ![A blue, messy grid that resembles a map. Generated with the prompt 'Boston commuter rail map, PDF, 2017'](/posts/images/boston_stable_diffusion_compressed.png "A blue, messy grid that resembles a map. Generated with the prompt 'Boston commuter rail map, PDF, 2017'.")
> 
> A map of the Boston subway system, generated using Stable Diffusion. It's not even close, of course, and it'd be silly to rely on this. See [the real map](https://www.mbta.com/maps) for comparison.


# Phillip Rogaway is one of many incredibly cool cryptographers

> **tldr:** Remember when "crypto" meant "cryptography" and "crypto is a human right" didn't sound so silly? Then you might like to browse Philip Rogaway's works.
> 
> Here's a list of papers I recommend:
> 
>  - [2015 *"Keys Under Doormats"*](https://dspace.mit.edu/bitstream/handle/1721.1/97690/MIT-CSAIL-TR-2015-026.pdf)
>  - [2021 *"Bugs In Our Pockets*"](https://arxiv.org/pdf/2110.07450.pdf)
>  - Rogaway's 2015 [*"The Moral Character of Cryptographic Work*"](https://www.cs.ucdavis.edu/~rogaway/papers/moral.html)
>  - Rogaway's 2020 [letter to students, cancelling his "Cryptography and Surveillance" class.](https://web.cs.ucdavis.edu/~rogaway/classes/189/spring20/covid19.pdf) 

Cryptography is a fascinating field, but in my PhD studies I've almost only read those classical and technical papers, despite the fact that cryptography ultimately addresses social needs. Cryptography is practically a field of humanities!

There are, of course, [the venerable 2015 *"Keys Under Doormats"*](https://dspace.mit.edu/bitstream/handle/1721.1/97690/MIT-CSAIL-TR-2015-026.pdf) paper and [the lesser-known 2021 *"Bugs In Our Pockets*"](https://arxiv.org/pdf/2110.07450.pdf) paper, both of which are required reading for the intersection of cryptography and society.

For anyone hungry to read more, I must recommend Philip Rogaway, a cryptographer at the UCD: https://www.cs.ucdavis.edu/~rogaway/. Specifically, his paper [*"The Moral Character of Cryptographic Work*"](https://www.cs.ucdavis.edu/~rogaway/papers/moral.html), a 2015 paper that describes cryptography as a political tool that redistributes power. This is how I view cryptography, and it's why it is so important to me. But the paper is 33 pages long and I haven't read it all the way through yet.[^reading_rogaway: To be honest, I probably won't. If an academic says they skimmed a paper, it means they looked at the abstract. If they say they read a paper through, they probably skimmed it. This is a secret though, don't tell anyone.]

The abstract is as follows: 

> Cryptography rearranges power: it configures who can do what, from what. This makes cryptography an inherently _political_ tool, and it confers on the field an intrinsically _moral_ dimension. The Snowden revelations motivate a reassessment of the political and moral positioning of cryptography. They lead one to ask if our inability to effectively address mass surveillance constitutes a failure of our field. I believe that it does. I call for a community-wide effort to develop more effective means to resist mass surveillance. I plead for a reinvention of our disciplinary culture to attend not only to puzzles and math, but, also, to the societal implications of our work.

His work came up in conversation with a friend during a recent excursion, and I found a [2020 letter to students, describing a decision to cancel his "Cryptography and Surveillance" class in the face of the Covid-19 pandemic.](https://web.cs.ucdavis.edu/~rogaway/classes/189/spring20/covid19.pdf) It's a strangely validating letter to read now, because it feels like a testament to thoughts and feelings I also had at that time. Covid was *extremely uncertain and scary* in early 2020. Now, three years later, Covid is a known and navigable risk, with paxlovid and vaccines and effective masks generally available. But in 2020, it felt like a very plausible way for fragile supply chains to finally and irreparably fail, permanently changing our ways of life. That didn't come to fruition, but it *could have*. The very worst thing is that the preppers would have been correct and they would be *very smug about it.*

While writing this post, I found myself re-reading old papers, and came across two more that I can recommend:

 - ["Like Lesbians Walking the Perimeter": Experiences of U.S. LGBTQ+ Folks With Online Security, Safety, and Privacy Advice (Usenix 2022)](https://www.usenix.org/conference/usenixsecurity22/presentation/geeng), a paper in the intersection of cryptography and society. Recommended by a friend.
 - ["Reimagining Secret Sharing: Creating a Safer and More Versatile Primitive by Adding Authenticity, Correcting Errors, and Reducing Randomness Requirements"](https://eprint.iacr.org/2020/800.pdf), a technical paper from Rogaway that introduces a new primitive, "Adept secret sharing", to address real-world use cases. I found this while searching for cryptographic secret-sharing.



# Educational YouTube is still great.

> **tldr:** ThreeBlueOneBrown's *excellent* videos highlighted my increasing unease over my fading knowledge. Deciding to refresh it, I dug back into KhanAcademy's venerable backlog, starting both the AP Art History and Linear Algebra courses.

While watching ThreeBlueOneBrown's video on [Borwein integrals](https://www.youtube.com/watch?v=851U557j6HE), I realized I had forgotten much of the later math I had learned. Specifically, [Fourier transforms](https://en.wikipedia.org/wiki/Fourier_transform) and convolutions ([mathematical](https://en.wikipedia.org/wiki/Convolution). I recalled *what* they could do and their general ideas well enough, but I couldn't recall any of the specific transformations I could make use of.

With [Obsidian](https://obsidian.md/), I've finally found a notetaking solution that works well and hits all my checkboxes.
So I've been longing to build a personal wiki/reference of sorts, and it seemed sensible to do some self-study. I found myself on Khan Academy, thinking it might be a good use of time. During my undergraduate and graduate studies, I found great value in the few humanities I had taken in my undergrad. Thinking there might be value to broadening my horizons, I started the [KhanAcademy AP Art History course](https://www.khanacademy.org/humanities/ap-art-history/). I don't expect the same level of rigor one would get from an actual course (I still believe KhanAcademy is best as a study *aid*), but I'm still getting value from it.

Meanwhile, I'm also reviewing the KhanAcademy Linear Algebra course, referring also to the ['Linear Algebra' Chapter of Ian Goodfellow's *Deep Learning Book*](https://www.deeplearningbook.org/contents/linear_algebra.html) and [Kaare Petersen's and Michael Pedersen's *The Matrix Cookbook*](https://www.math.uwaterloo.ca/~hwolkowi/matrixcookbook.pdf). 

On my list is "Rational Trigonometry" (see https://web.maths.unsw.edu.au/~norman/Rational1.htm and https://stijnoomes.com/laws-of-rational-trigonometry/), an alternative formulation of trig rules with totally separate concepts. 

Having personal notes is extremely useful for reference, and I wish I did this earlier.



# The Rustonomicon makes Unsafe Rust fun to read about

> **tldr:** The Rustonomicon is a fun read, and might help you understand Rust a bit better. It's written in an engaging and evocative way, but it doesn't detract from the technical content.  

I had been stuck on a tricky ownership problem in my little self-educational Rust project (which turned out just to be a type issue). Out of ideas, I started reading [the Rustonomicon](https://doc.rust-lang.org/nomicon/), a cursed text which details unsafe Rust. It starts like this:

> ## The Dark Arts of Unsafe Rust
> 
> > THE KNOWLEDGE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF UNLEASHING INDESCRIBABLE HORRORS THAT SHATTER YOUR PSYCHE AND SET YOUR MIND ADRIFT IN THE UNKNOWABLY INFINITE COSMOS.
> 
> The Rustonomicon digs into all the awful details that you need to understand when writing Unsafe Rust programs.
> 
> Should you wish a long and happy career of writing Rust programs, you should turn back now and forget you ever saw this book. It is not necessary. However if you intend to write unsafe code — or just want to dig into the guts of the language — this book contains lots of useful information.

The book maintains the air of intrigue and cursedness appropriate for one titled after the necronomicon, and it does indeed provide some of the insights I was looking for. It starts by introducing Rust as two halves, one Safe and Unsafe, in a surprising asymmetric relationship: The safety of Rust relies on the Safe half trusting everything the Unsafe half provides, while the Unsafe half can trust very little from the Safe half.

I really encourage reading this book. There is no narrative, and yet it feels like I'm reading a fascinating book. Not even [the SICP does that!](https://web.mit.edu/6.001/6.037/sicp.pdf)

(On a side-note, I discovered that I was a fan of the author of the Rustonomicon for years before I knew her name. [Aria Beingessner](https://faultlore.com/blah/) is also known for her work with good blogposts like ["C Isn't A Programming Language Anymore"](https://faultlore.com/blah/c-isnt-a-language/) and the original Homestuck flash games. Being a Homestuck fan and Rust enjoyer, I'm a big fan of her work and writing.)


# FiveThirtyEight's podcasts and models are a fun and scary source for applied Bayesian thinking

> **tldr:** If you like US politics and probabilistic thinking, I can recommend the FiveThirtyEight politics podcast. 

A lot of my internal conceptualization of the world revolves around understanding the world as a system of continuous parts which can be better described with probabilistic fuzzy terms than absolute discrete terms. Understanding an individual entity as inseparable from the whole, etc., yadda yadda. I'd go so far as to say any discrete thinking is a simplification at best, and a fallacy at worst, but that's a different blogpost.

But we use discrete words, and without discrete terms to describe continuous or otherwise fuzzy ideas, one is lonely.

So I really do appreciate FiveThirtyEight, which takes a fuzzy, probabilistic and statistical approach to a very binary task of "election predictions".  I also appreciate 538 for being a rounded and fun podcast. It is the only piece of media that I could recommend to someone that uses Bayesian thinking as a matter of course. Terms like "priors" and "probability" is common on their podcast.

FiveThirtyEight publishes the results from their model with percent chances on each outcome, but [it also allows you to play with a model given any other kind of win.](https://projects.fivethirtyeight.com/2022-flip-senate-house/) This is a Bayesian toy! As the election results came in for each state, I found myself playing with their model, seeing how the model predictions updated with each called race. 


# Audiobooks are good actually

> **tldr:** Give audiobooks a try if you haven't. I value the meditative moments an audiobook might fill, but they have given me more to think about in the other moments.
> 
> For accessing audiobooks, the Libby app is great, but I don't think it is sustainable for authors and publishers to offer audiobooks, so get it while you can.
> 
> I listened to "How To Be An Antiracist", "A Wizard of Earthsea", "Leave the World Behind", "Braiding Sweetgrass", and I've started "Caste: The Origins of Our Discontents". I don't directly review these books here, but I recommend them.
> 
> I'm really happy I tried audiobooks, because they're good, actually. There are two problems: (1) It's easy to get distracted, and scrubbing a timeline is worse than flipping through pages. (2) An audiobook flips the role of pacing from the reader to the narrator, requiring one to actively pause to take a moment to meditate and digest over what they just heard.

With all this free time, I've been driving on occasion for hikes, bussing to visit friends out of state, and going for long walks. I appreciate the silence and free time to let my mind wander and to come up with ideas. But I also want to take advantage of Libby (an app which lets you rent audiobooks from your local library) before it goes away (because there's no way it's financially sustainable.)

But I was an audiobook skeptic, imagining audiobooks to be strictly inferior way of reading books. I didn't know I had this unconscious bias, Then I listened to Ibram X Kendi's "*How to Be an Antiracist*", having had read it a few years back. Narrated by the author himself, I could really appreciate the new expressive dimensions of tone and pacing.

That is to say, the audiobook *adds information* that the book couldn't. I was surprised to find myself open to the possibility audiobooks may be *superior* to print.

Reading books on a screen is unappealing (and I don't want to buy an ereader while the technology is still expensive and strangled by eink patentholders), and buying or borrowing books is inconvenient. So, I was already sold on the convenience of audiobooks, but I'm surprised to find myself consuming many books through it.

With this new mindset, I decided to listen to the first two of the acclaimed *"Earthsea"* books, having had heard good things of Ursula K. LeGuin's work. The first book, *"A Wizard of Earthsea,"* was primarily narrated by Harlan Ellison. The narration gave the vibe of some omniscient narrator, describing events as they happen. As if he was not reading from a script, but instead peering into the world of the book, sometimes *squinting* to discern detail, as if describing events as they unfolded. There was an audible clinking of metal, as if he was garbed with some jewelry. This narration added some character that I assume would not have been in the ink-and-paper version. I listened to the sequel, *"The Tombs of Atuan"*, through Rob Inglis's narration. His was similar but less eccentric than Ellison's, but I feel roughly the same.

I don't regret being introduced to *Earthsea* in this manner! It felt great to indulge in fiction 'reading' for the first time in awhile.

Excited to see what else was out there, I looked for available and trending audiobooks within the Libby app. It was refreshing to use the Libby app. No advertisements, no dark patterns, no grease of profit incentive. It makes me trust that is recommendations are weighted not by advertisers dollars, but by statistics like "download count" or "most minutes listened to in the past day". Libby has a utilitarian design, of an app that does what it does and no more. No goofy over-the-top polish like 3D elements or [physically based rendering](https://en.wikipedia.org/wiki/Physically_based_rendering) you see in some other apps. Libby is an app for reading books, no more than that. It knows what it is.

From Libby's recommendation, I then read *"Leave The World Behind"* by Rumaan Alam. This book was enjoyable enough to finish, but I wonder if I would have preferred it as a book, being quite short. If you like vague apocalyptic horror, I can recommend it: It features characters brought together during a storm, kind of like [Pygmalion](https://en.wikipedia.org/wiki/Pygmalion_(play)), as they find themselves stranded at an AirBnB during a long power outage.  Then things get much worse.

After a fiction bender, I needed something substantive. I'm now listening to "Caste: The Origins of our Discontents" by Isabel Wilkerson. It analyzes the history of racism in the United States through the lens of a caste system. It is filled with references and historic accounts, many of them graphic and horrifying and deeply unsettling. 

But as I listen to Caste, I also find myself searching the references, facts, etc., intermittently pausing and unpausing the audiobook. While audiobooks have grown on me, my experiences have highlighted two problems:

First, it is easy to get distracted during an audiobook, and to miss what exactly is being said. If one is listening to an audiobook while preparing tea or cleaning a room, one might find themselves reversing to relisten to a section, without the hard and fast guidelines of page number and line to go by. This is a navigation issue that is difficult. 

Second, one has to actively pause their listening to in order to reflect and digest what they've just heard. This is not the case when reading text, since we set the pace with our eyes. There is no narrator with a physical book.

# TV got really, really good.

TV is the last vestige of the serial-publication format of fiction. A great way to build a community is to have a weekly cliffhanger, to keep the show in someones mind all week, speculating on what comes next.

But a good show is still good if you watch it after the fact, episode following episode. 

Those kinds of shows are going away with streaming, where entire seasons are dropped at once. But the ones that are still left are great.

Here are some *very good shows* I watched in 2022 and 2023 which I must recommend:

- **Mr. Robot** is the best of them and I can't do it justice with a description. I watched it in 2019 and again in 2022. You owe it to yourself to watch this show, because it is simply one of the best.
- **Better Call Saul**, the prequel to Breaking Bad, finished in 2022. Watch Breaking Bad first. These are some of the best shows out there.
- **The Rehearsal:** Nathan Fielder's sequel to "Nathan For You" takes the premise and goes wild with it. It's funny, it's surprising, it's shocking, it's difficult. Like "Nathan For You", the show depicts real people with real reactions to real situations, except for the narrator, Nathan, who lies and cherrypicks to present a narrative.
- **The Last of Us** premiered in 2023. The zombie apocalypse is a great narrative tool that allows the writers to put people into a situation. The acting is phenomenal and the show is immersive. Every actor seems like a real, breathing, thinking person. Don't let the fact that it's a "zombie show" turn you off. It's a show about people, and it's very *very* good.




# Outer Wilds is the best videogame I've ever played.

Outer Wilds (*not* [The Outer Worlds](https://store.steampowered.com/app/578650/The_Outer_Worlds/)) is an adventure game with an emotional story. It's difficult to review, because it's best played with no information whatsoever, because learning and gaining information is the most important part of the gameplay. [Outer Wilds is $25 on Steam](https://store.steampowered.com/app/753640/Outer_Wilds/), and takes about 20 hours to beat. If you're willing to gamble $25 and an hour or two, please consider it. It is one of the most intellectually stimulating pieces of media I've played with.

In the discussion of whether videogames are art, Outer Wilds makes it easy to show they are art. This is because it tells a story that can only be told as a videogame. 

# Nope (2022) is my favorite movie of the year, and I don't even like horror or movies! (Mild spoilers)

> **tldr:** *Nope* is a science-fiction horror movie from filmmaker Jordan Peele. *Nope* kept me engaged and thinking the whole time, and for quite some time after. Peele lives up to the high expectations he's set as a filmmaker with his previous films *Get Out* and *Us*. I highly recommend *Nope*, even if you do not like horror.

[**"Nope"** (2022, film)](https://en.wikipedia.org/wiki/Nope_(film)) is my favorite "reading item" of the month. It's a film by Jordan Peele, known for creative horror films with deep themes, symbolism, anime references, and difficult-to-google names. Peele might be the first filmmaker who I consider myself a fan of, because each and every one of his movies have left me thinking about it for *weeks* after I've watched them. I can't get it out of my mind.

I left *Nope* feeling like I had just read a great book. I don't want to spoil it, and that makes a review hard, but I will do my best. I encourage you to watch the film before reading this.

Nope uses some classic narrative tricks to great effect. Flashbacks are used very sparingly to tell its story, building a select few scenes in an unforgettable manner. One in particular is gruesome, beautiful, and wrenching, and it cements questions in the viewers mind which are answered over the course of a movie.

Peele has proven to me that horror can be good and interesting without relying on supernatural ghost curse magic. Nope centers around a mysterious and malevolent entity, a "monster" element in horror parlance. When a movie has a monster, it only gets to reveal it once (if at all), and as a viewer, we wonder: Will there be a reveal? When? All at once, or bits at a time?

Well, *Nope* reveals the malevolent entity in a peculiar, interesting, nearly unbearable way that I hadn't considered before. It satisfies curiosity while being horrifying.

But, *Nope* is also a movie that tells a generational story. By making the protagonists brother and sister, and setting the film around their family ranch, *Nope* makes plenty of room to subtly tell that generational story. You learn about the characters and their ancestors through worldbuilding techniques that you don't normally see in a film already grounded in our real-life world.

This film makes some significant symbolism and themes surrounding Black history and colonial history. With the story taking place on a ranch the main duo had inherited, we see these histories merge in ways that are atypical and uplifting. 

For one specific example, the film weaves ["Animal Locomotion, Plate 626"](https://en.wikipedia.org/wiki/Animal_Locomotion), a significant early film recording of a Black farmhand riding a horse, into the plot. Despite the historical importance, the Black farmhand is uncredited and not known by name to history. This injustice leaves a gap in knowledge for the film to integrate into its own plot. The fourth wall is broken, subtly, just enough to highlight this injustice.

There's more to say here, but impossible to do so without spoIling significant plot revelations. Ultimately, NOPE took the place of my favorite film of 2022.
