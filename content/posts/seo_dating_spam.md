+++
title = "Oh no, dating spam sites are abusing improperly-configured internal search engines"
date = 2021-04-30

aliases = [ "/posts/seo_dating_spam.html" ]

[taxonomies]
tags = ["post", "security"]
+++


> **tldr:**  Malicious entities are abusing sites internal search engines to promote their own URLs. This effectively allows them to advertise using the target site's domain in the search results of major search engines. If you own such a site, fix this by putting a `disallow` entry in your `robots.txt`, or adding the `noindex` meta tag.

<!-- more -->

# A Mystery of Malware in My School's Search Results

Recently, a colleague of mine was trying to see if our university had any carbon dating expertise. A search on Google for `uconn carbon dating` yielded some results she considered sus:

![A screenshot of a Google Search for 'UConn Carbon Dating', showing some malicious looking results promoting some malicious dating sites.](../images/datego-edu-spam-uconn.png "A screenshot of a Google Search for 'UConn Carbon Dating', showing some malicious looking results promoting some malicious dating sites.")

Like any fool, I clicked through the link to see what was going on. Here's that first link, with linebreaks to make it easier to interpret:

```
https://chemistry.uconn.edu/?s=
%F0%9F%AA%80%E2%9D%A4%EF%B8%8F%EF%B8%8Fwww.datego.xyz
%F0%9F%AA%80%E2%9D%A4%EF%B8%8F%EF%B8%8Fcarbon+dating+past+50000+years+year+
%F0%9F%AA%80%E2%9D%A4%EF%B8%8F%EF%B8%8F+BEST+DATING+SITE+
%F0%9F%AA%80%E2%9D%A4%EF%B8%8F%EF%B8%8F
+carbon+dating+past+50000+years+year+carbon+dating+past+50000+years+year+
carbon+dating+past+50000+years+year+carbon+dating+past+50000+years+year+
carbon+dating+past+50000+years+year+carbon+dating+past+50000+years+year+
%F0%9F%AA%80%E2%9D%A4%EF%B8%8F%EF%B8%8Fwww.datego.xyz
%F0%9F%AA%80%E2%9D%A4%EF%B8%8F%EF%B8%8F+BEST+DATING+SITE
```

Ugly! Let's use Python's `urllib.parse.unquote(string)` function to clean this up. This gives us:

```
https://chemistry.uconn.edu/?s=
🪀❤️️www.datego.xyz
🪀❤️️carbon+dating+past+50000+years+year+
🪀❤️️+BEST+DATING+SITE+
🪀❤️️
+carbon+dating+past+50000+years+year+carbon+dating+past+50000+years+year+
carbon+dating+past+50000+years+year+carbon+dating+past+50000+years+year+
carbon+dating+past+50000+years+year+carbon+dating+past+50000+years+year+
🪀❤️️www.datego.xyz
🪀❤️️+BEST+DATING+SITE
```

where '🪀' and '❤️️', if you can't see it, are Yo-Yo and Heart emojis, respectively. Upon inspection, it seems that these are just searches abusing the sites internal search engine. They become emoji in the URL.

It's pretty standard, you can make searches for arbitrary text. For example, `chemistry.uconn.edu/?s=some+arbitrary+text` yields such a URL: [https://chemistry.uconn.edu/?s=some+arbitrary+text](chemistry.uconn.edu/?s=some+arbitrary+text)

It seems UConn isn't the only one impacted. While not exclusive to .edu domains, it looks like they're the primary targets. Here, we see the same thing for other .edu domains:

![A screenshot of a Google Search for 'datego.xyz site:edu', showing some malicious looking results promoting some malicious dating sites.](../images/datego-edu-spam.png "A screenshot of a Google Search for 'datego.xyz site:edu', showing some malicious looking results promoting some malicious dating sites.")

So, what's going on here? I think I have an idea.


# An Explanation for these Egregious Search Results

So, my guess here is that the attack works like this:

1. Find websites with 'search' boxes following the convention of `{url}/s={search text}`.
2. Enter a search pointing to your very cool and totally legit dating site.
3. Abuse search engine optimization so this malicious search result hits the top!
4. ???
5. ... Profit?

There's surely a name for this kind of attack, but this is my first time seeing it! Please let me know if you've seen this before.

And now, a curious mind might wonder, does this work for big search engines? Can one abuse this to do `google.com/search?q=some+arbitrary+text` or `duckduckgo.com/q=some+arbitrary+text`? No! Why? Let's see.


# How to Stop for this Salacious Shady Search Meta-SEO

I'm not a web developer, but one usually doesn't want their search results to be indexed on other search engines. They clutter up results for the end-user, and, as we see here, it opens you up for a rather ugly attack. As far as I can tell, there are two main ways to fix this. Luckily, they're both easy!

1. **Fix the `robots.txt`** 
2. **Add the `noindex` metatag.**

We can see both of these in action by observing Google (which uses `robots.txt`) and DuckDuckGo (which uses both `robots.txt` and the `noindex`.) While not strictly required, major search engines will respect these tags.

## Fix this using robots.txt

First, let's look at [google.com/robots.txt](https://google.com/robots.txt). The first few lines are copied below:

```
User-agent: *
Disallow: /search
Allow: /search/about
Allow: /search/static
Allow: /search/howsearchworks
Disallow: /sdch
Disallow: /groups
Disallow: /index.html?
Disallow: /?
...
```

And let's also take a look at [duckduckgo.com/robots.txt](https://duckduckgo.com/robots.txt). Their entire `robots.txt` is copied verbatim here:


```
User-agent: *
Disallow: /lite
Disallow: /html

# No search result pages
Disallow: /*?

# chrome new tab page
Disallow: /chrome_newtab

User-agent: ia_archiver
Disallow: /

Sitemap: https://duckduckgo.com/sitemap.xml
```

The syntax is pretty clear! Observing other sites impacted by this show that `robots.txt` does *not* disallow search. For example, [upike.edu/robots.txt](https://upike.edu/robots.txt) is listed verbatim below:

```
User-agent: * 
Crawl-Delay: 20
```

Here, they don't block crawlers from any part of the site, but will ask crawlers to slow down a little and crawl a page only once every 20 seconds.

**A heads up!** You need to set up your `robots.txt` properly **for every subdomain**. For example, I noticed at least 25 UConn subdomains that had this problem. But the robots.txt at `uconn.edu/robots.txt` had the correct entry, `Disallow: /*?s=`/


## Alternatively, fix this using 'noindex'.

If one searches on DuckDuckGo and were to inspect the page, would see this in the `<head>` section of the page:

```html
<meta name="robots" content="noindex,nofollow">
```

Now, because of DuckDuckGo's `robots.txt` file, an indexer won't even see this. But if it did, it would know not to index it (per `noindex`) and not to index any links on the page (per `nofollow`).

One can also, alternatively, add `X-Robots-Tag: noindex` to the HTTP response header. Google has more information on their page ["Block Search indexing with 'noindex'" at developers.google.com/search/docs/advanced/crawling/block-indexing](https://developers.google.com/search/docs/advanced/crawling/block-indexing)


# Neat! So, Did you disclose this disaster?

Regarding responsible disclosure, I did give a heads up to UConn's IT department, since I am a UConn student and employee. But given the low impact of this attack and how widespread it is, I figured a blogpost would be more than appropriate. 

