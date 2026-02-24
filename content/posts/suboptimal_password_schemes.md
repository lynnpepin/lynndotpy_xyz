+++
title = "(Pt 1) Schemes for the Passwords you Don't Put in the Password Manager"
date = 2025-02-24

[taxonomies]
tags = ["post", "security", "passwords"]
+++

The correct answers regarding passwords are the following:

1. Prefer key authentication, such as with SSH, when possible.
2. Use TOTP 2FA when possible.
3. Use a password manager, with strong (highly entropic) and unique passwords.

This is all fine and dandy, but what about your computer? Your phone? Your password manager itself? These are passwords you do *not* store in your password manager, and you should memorize strong and unique passwords for these.

Keeping in mind that choosing a good password is not necessarily about having high entropy. A highly-entropic source could generate "password!123" as a random, twelve-character password. The actual goal is to choose a password that your attacker is very unlikely to guess.

In practice, the attacker wants to construct a distribution $P$ of passwords *you* are most likely to have, and you want to anticipate this to choose a password from the complementary distribution $P'$. It's just the case that a dedicated attacker is usually much smarter than you, and by trying to anticipate what $P'$ is, you are more likely to choose a password higher up in the ranking implied by $P$ than if you just went with a long, random one to begin with.

With all that said... *You still need to memorize some passwords*. Deriving passwords has worked well for me and many others before adopting a password manager. 

There are three main choices:

1. Write the password down
2. Derive a password for these through a scheme, or
3. Just memorize random passwords.

This post is **part one** of a two parter. **Part two** has an improved actual password scheme, which is upcoming!

> **tldr**:
> 
> Password managers and 2FA are great, but you still need to memorize some passwords (such as the one to your laptop, your phone, or to your password manager). Assuming you don't write these down, how can you remember all these?
> 
> Password derivation schemes might provide ~7 bits of true entropy, and many more bits of "apparent" entropy, relying on the obscurity of the derivation scheme. This falls apart in the face of an adversary that gets even just one of your passwords, or an adversary that is smarter than you who can anticipate your scheme. It is a good bet to make that any given adversary will be smarter than you.
> 
> We need a scheme which is low on the mental burden of memory, for which compromising one password does not necessarily compromise the rest. We can improve on memorizing unique entropic passwords.
> 
> Some memory tricks include preferring words over random strings (for the same amount of entropy), and using capitalization and numbers-as-delimiters to get some extra entropy. Those help, but still, we can do a little better than memorizing N-passwords for N-devices.


---


# Writing down passwords is risky. Memorizing many random passwords is good but difficult.

> **tldr**: Besides password managers, some people write down passwords (which can be good!) Another opportunity is just to memorize unique, entropic passwords, but this depends on having a strong memory. This does not scale well if you have multiple devices.

**Writing the password down** is actually pretty good. This lets you set up an arbitrarily strong password without worrying about memory, and the risk model is apparent to anyone: People who live with you, or who can break into your house, can get your passwords. The benefits are also apparent: If you suffer a brain injury or die, the passwords persist. Further, there's no risk that your notepad of passwords can be stolen in a digital hack.

Let's assume you've already considered writing down your passwords, and that won't cut it.

**Just memorizing** random passwords is another choice. Let's say a given person can memorize 72 characters worth of random passwords. This is enough to dedicate 24 random characters to your password manager, 24 random characters to your desktop/laptop, and 24 random characters to your phone. At about 6.55 bits per character, this brings us to 157 bits of entropy per password. So, **this is good enough** by a lot.

But that requires a hefty memory! What if people could only memorize 36 characters? That brings us to 78.5 bits, which might not be enough.

Let's assume they can still only remember $N=36$ random characters worth of entropy, or about 240 bits. This lets us account for entropy in the form of [random words](https://xkcd.com/936/) or random characters alike.

**Just memorizing passwords** is difficult to recommend. What if you *also* need to memorize, say, passwords for your work phone and laptop? And for a volunteer phone and laptop? Bank pins? What if you have a bad memory *and* you need to stretch it for a dozen devices?

# "Deriving passwords" lets you get extra entropy 'for free' without burdening your memory. But you can lose most of that entropy with just one leak.

> **tldr**: If you can keep your password derivation scheme private, you can have passwords which might appear highly entropic. But this relies on security by obscurity. Just one leaked password compromises the rest of them. In this example, a password with 165 bits of entropy drops to less than 60 bits of entropy with a compromise of just one other password.

So, people might instead **derive a password**. There are many ways someone might construct this, but I usually see two or three of these components:

1. Use as input the **name** of what you're signing into.
2. Have a highly entropic "**base password**" that is used in the password.
3. Have a highly entropic "**extra password**" that is used in the password.

Remember the hacker's distribution $P$? The "derive a password" strategy is one with the intention of generating a password *deterministically* in a way that has a higher apparent entropy than there is. The **apparent entropy** is the measure of how much lower the given password is in the attacker's distribution $P$. That is to say, the n-th password the hacker would guess has an apparent entropy of $log_2{n}$.

> "**Apparent entropy**" is not a term-of-art, by the way. It's a term I made up and didn't end up publishing. It's the best way I know to articulate the idea that these password-derivation techniques do provide some security, against the "normal" case of an attacker using `hashcat` against a leaked corpus of hashes. My game theory is rusty but I am *certain* the idea of "apparent entropy" must exist in the literature. If there is such a term or framework, please email me!

Anyways, let's look at an example of how this works:

> **For example**: Someone is logging in to their *laptop*.
> 
> This person can remember 36 random characters. With one "base" password and three logins (laptop, password manager, phone), they dedicate 9 characters to a "base" password, 9 characters to an extra per-login password, and they also derive extra components from the name `laptop`.
> 
> Their BASE PASSWORD is the same across all devices and is randomly generated: `Q-R!yFqq-`
> 
> Their EXTRA PASSWORD is unique to their laptop: `2DkF!pEEq`.
> 
> Finally, they derive a pattern from the first three characters `LAP`, by drawing a spiral on the keys: L yields `l;po`, A yields `aswq`, and P yields `p[-0`.
> 
> Their password is `Q-R!yFqq-2DkF!pEEql;poaswqp[-0`.
> 
> Traditional security advice will tell you the derived parts provide no entropy, but it's almost certain an attacker would guess `Q-R!yFqq-2DkF!pEEql` long before they guess `Q-R!yFqq-2DkF!pEEql;poaswqp[-0`.
> 
> *(Except for the fact that string appears in this very-publicly-online text post!*)


Using the name of what you're signing into (e.g. "phone", "laptop", "1password") carries with it extra decisions:  Do you input the whole name? Do you use the first 1, 2, 3, 4 characters? Maybe you map the characters to a pattern on the keyboard, or the phonetic alphabet, or some personal lookup table? And the order of these elements matter: Input, base, extra? Base, input, extra? There are three such orderings, so this gives us about **1.5 bits of entropy** "for free", since they presumably don't burden ones memory.

For the **decisions** someone has to make when deriving a pattern. This gives us more "free" bits of entropy: **Two bits of entropy** for choosing how many characters (1, 2, 3, or 4) to use from the input, and **another bit of entropy** for choosing whether to pull from the front or the back.

Let's assume the user is *not* memorizing a lookup table, and is choosing one of a few obvious QWERTY-based patterns. The actual pattern might add, *generously*, 3.5 bits of entropy to make for **a total of seven bits of entropy total from decisions on how to derive the password**. Again, this is "free". But seven bits of entropy *is about the same that you get for just one extra character*.

The main benefit comes from the **apparent entropy** from the derived string. In the example above, `l;poaswqp[-0` technically provides zero bits of entropy for being deterministically generated. But *if* it would take an attacker one trillion more guesses after `Q-R!yFqq-2DkF!pEEq` to guess `Q-R!yFqq-2DkF!pEEql;poaswqp[-0`,  that would provide almost 40 extra bits of apparent entropy! 

This all relies on **security by the obscurity of your strategy**, making a more rigorous analysis elusive. Security people are oft to deride any security-by-obscurity schemes, and for good reason. If just one of these passwords leak, or even two, you can kiss all that extra entropy goodbye for your other passwords. You miss the 7 bits of entropy from the derivation scheme, the ~40 bits of apparent entropy from your pattern, but importantly, **you also lose the base password**. So, you lose ~58.9 bits from the base password, ~39.9 bits of apparent entropy, and ~7 bits of entropy you get for free from the details of the construction. So, you move from 165 bits of apparent entropy to merely 58.9 bits of entropy from your "extra" password. 

# Geeze, passwords sound impossible.

> **tldr**: Solving this problem requires some kind of derivation scheme which (1) does not rely on obscurity of the scheme and (2) does not compromise every other password if just one leaks.

The problem is as follows:

1. People still need to memorize some passwords.
2. People have limited capacity to memorize these passwords.
3. Existing derivation schemes are crippled if one password (or even just the scheme) gets leaked.

I, personally, have to memorize passwords for two phones, a laptop, a desktop (decryption key _and_ sudo), my servers, and (formerly) a work laptop.

For my phones, one is a "throwaway" phone and only has a long pin. My primary phone also has a long pin. Both of which are protected by hardware modules which make it difficult to brute-force the password. For my work laptop, it demanded a new password every few months, so my password was unique and weak.

But I am still left with *six* random passwords I need to memorize!

# Memory tricks *before* we get to the password scheme

> **tldr**: If you are character-limited, I think it's better to use random lowerchase characters, and to memorize them using a song, poem, or phrase.
> 
> Other than that, just go with random words! It's the easiest.
> 
> A user can memorize a password they use every day by writing it down, and destroying the password element-by-element.

I have difficulty memorizing long strings with random punctuation. One gets 4.70 bits-per-character for the set of lowercase characters, up to 5.17 if you add numbers, and up to 5.95 bits per character if you include capital letters. You need two symbols to make that a perfect 6.0.

Further, though the idea of memorizing 72 random characters is scary, I still remember *Jingle Bells* and *The Declaration of Independence* and most of Hamlet's *To Be or Not To Be* soliloquy. Socrates famously rallied against writing, instead preferring people rely on their own memory. The oral tradition is what carried knowledge on, and music and poem is the way that was done.

So, I argue for memorizing *more* characters from a *limited* set by *writing a poem about it*. It helps if you happen to know other languages. This is something meant to get more entropy-per-memory-burden. It's not based in any actual research.

But I'd say **just go with random words**. 1passwords [wordlist](https://github.com/1Password/spg/blob/master/testdata/agwordlist.txt) is 18325 words long, which comes out to about 14.16 bits per word. The average word is 6.2 characters long and the longest is 9, so even a conservative 63-max character password gets 99 bits of entropy at minimum with seven words.

To memorize a long password the user will use every day, they can start by writing it down, and destroying one element each day as they commit each word to memory. How to commit something new to your memory is up to you to figure out.

# So, what's the scheme?

That's for part two! I'm still writing it! :)i
