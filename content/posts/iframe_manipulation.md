+++
title = "Oh no, your website makes it easy to put malware in an iFrame."
date = 2024-03-09


[taxonomies]
tags = ["post", "security"]
+++

I was searching for hits on an CreditKarma.com error-phrase "It looks like we're having some trouble accessing your Credit Karma account" when I found a result at `https://www.middlesex.mass.edu/templateinframes/?Site=Help&Url=https://lrmdz.bartikus.site`.

Look at the structure of this URL! You can put `https://www.middlesex.mass.edu/templateinframes/?Site=Help&Url={ANYTHING YOU WANT}`, and in this case, it looks like `bartikus.site` is using the legitimacy of Middlesex Massachusetts to host a CreditKarma phishing link.

This is similar to [how scam sites abuse improperly-configured internal search engines to hit Google's frontpage](https://lynndotpy.xyz/posts/seo-dating-spam/).

Generally speaking, it's best to avoid letting arbitrary people fill out an iFrame on your website. [To prove this point, I'm sending this webpage to Middlesex Community College within an iframe on their own site.](https://www.middlesex.mass.edu/templateinframes/?Site=Help&Url=https://lynndotpy.xyz/posts/iframe-manipulation/) One could easily replace my post with a URL to malware, pornography, etc.


---

**Update** 2024-July-17th: It appears that Middlesex has recently stopped allowing this iFrame manipulation! I made this post after being unable to reach them in any other capacity-- I guess this post is what finally got through. 
