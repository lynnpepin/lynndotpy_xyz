+++
title = "lynndotpy.xyz is now lynndotpy.dev"
date = 2024-07-18

[taxonomies]
tags = ["post", "meta"]
+++


> **tldr:** This site [`lynndotpy.xyz`](https://lynndotpy.xyz) is now hosted at [`lynndotpy.dev`](https://lynndotpy.dev), because (1) `.xyz` domains are associated with spam, and (2) `.dev` domains are trendy!!

<!-- more -->

Exciting times, huh?

I set up this blog in 2020 as a custom static-site generator. The `.xyz` domains were cheap, fun, and didn't require TLS.

I would occasionally send my friends links to posts on my blog, and as [SpotVirtual](https://www.spotvirtual.com/blog/the-perils-of-an-xyz-domain) noted, many cellular and email providers would *silently drop messages which contain any URL with a `.xyz` domain.*

So, I bought `lynndotpy.dev`, and set up my Caddyfile appropriately, which worked fine for awhile.

```Caddyfile
lynndotpy.xyz {
  encode zstd gzip
  root * ./blog/public
  file_server
  header {
    # disable FLoC, Topics tracking
    Permissions-Policy "interest-cohort=(),browsing-topics=()"
  }
}

https://lynndotpy.dev {
  redir https://lynndotpy.xyz{uri}
}
```

(You can read more about the `Permissions-Policy` in my header [here](https://lynndotpy.dev/posts/caddy-topics-optout/).)

I liked my `.xyz` domain because it felt quirky and fun, and suited to the miscellania I wanted my blog to be about. I make card games! I make Blender renders! I make little Godot games! I contain multitudes, and all that jazz!

But then I noticed something... "Big" XYZ sites like the aforementioned [spot.xyz](https://spot.xyz) now redirects to [spotvirtual.com](https://www.spotvirtual.com/). There's a trend of leaving old `xyz` domains to redirect to a more traditional TLD,  like [blueskyweb.xyz](https://blueskyweb.xyz/). The ones which *aren't* redirecting are all "web3" things. NFTs, metaverse, the likes. *Yuck.*

Come to think of it, I've barely posted any art or anything here. I'm a developer and I'm getting a kick out of deveoping. I'm having a great time with the vimlike [Helix editor](https://helix-editor.com/). But I really don't want to be associated with the kind of cruft you see on `.xyz`.

So, welcome to `lynndotpy.dev` :)
