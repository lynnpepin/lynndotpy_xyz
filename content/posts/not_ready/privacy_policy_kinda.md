+++
title = "Private Policy, kind of"
date = 2023-07-04

[taxonomies]
tags = ["post", "privacy"]
+++

> **TLDR:** This site takes special effort to collect no data. Only normal server logs are collected, which includes IP, OS, browser, and referrer info.

TODO: OPT OUT OF CHROME TOPICS

<!-- more -->

This site has no analytics or telemetry, uses no cookies, uses no JavaScript (except to render LaTeX equations), and stores very very little information.

The only thing my blog stores are logs of the visitor IP address and HTTP headers. These headers include OS, browser version, and referring URL. This is basic information logged on almost any web server in the world. (Under GDPR, I have [a legitimate interest](https://gdpr-info.eu/art-6-gdpr/) to collect this data. As of this writing, the vast majority of traffic I get are from scrapers and hacking bots. I use `fail2ban`, self-hosted on the same server, to block these by IP address.)

This site also stores statistics about hits and responses. This way, I can see when bots attempt to break into, say, `wp-admin.php`.

This site takes care to load **no external dependencies**. This site does use the Hack font and KaTeX, but these dependencies are self-hosted. This means no hits to a third-party host like Google or `cdn.jsdelivr.net`. This takes effort, but is good for privacy!

There are only a few left over areas of concern for data exfiltration. 

 - This site has a lot of external links! They all almost certainly scrape mor information than I do.

 - Your ISP or network admin (or VPN provider) can see you are visiting this site, and if they've compromised your device (say, by installing their own certificates), they can see what parts of the site you visit, too.

 - This site is hosted on Digital Ocean, which means they own the server my site runs on. I can't control what they do, but they shouldn't be storing any further data about you.
 
 - Further, this site is hosted in the United States, which is known for spying on its own citizen and is part of the [Five Eyes spying alliance](https://en.wikipedia.org/wiki/Five_Eyes). I can't control what they do either. Sorry!

 - If you're running a bot trying to brute force my server, then I had the username + password combinations you're trying to use. (`woheaini` is the cutest password I've seen so far-- it's pinyin for 我和爱你, or, "I love you very much".)

