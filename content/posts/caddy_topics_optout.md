+++
title = "Caddy: How to Opt out of Chrome Topics API"
date = 2023-07-13

[taxonomies]
tags = ["how-to", "caddy", "privacy"]
+++

> **TLDR:** Set the following in your caddyfile for each site: `header Permissions-Policy "interest-cohort=(),browsing-topics=()"`. This disable both the old FLoC and the new Topics.


Here is an abbreviated version of my Caddyfile, showing how I set the `header1` file for `lynndotpy.xyz`:

```caddyfile
lynndotpy.xyz {
  header {
    Permissions-Policy "interest-cohort=(),browsing-topics=()"
  }
}
```

To confirm this is set, open the networking tab of your favorite browser's dev tools and look for the Permissions-Policy response header. More context below the cut.

<!-- more -->

**More context:** Google has renamed and tweaked its controversial 2021 ["Federated Learning of Cohorts"](https://en.wikipedia.org/wiki/Federated_Learning_of_Cohorts) tracking project and replaced it with the [Topics API](https://www.theverge.com/2022/1/25/22900567/google-floc-abandon-topics-api-cookies-tracking). These are surveillance capitalism tools built into Chromium-based browsers.  Unless you explicitly opt out, **every website will participate in Google's Topics API** when a Chrome user visits it.

Here is the full "Opt out your site" section from Google's "Topics API developer guide" (see `https://developer.chrome.com/docs/privacy-sandbox/topics/#site-opt-out`), accessed 2023-Jul-13:

> You can opt out of topic calculation for specific pages on your site by including the `Permissions-Policy: browsing-topics=()` [Permissions-Policy](https://developer.mozilla.org/docs/Web/HTTP/Headers/Feature-Policy) header on a page to prevent topics calculation for all users on that page only. Subsequent visits to other pages on your site will not be affected: if you set a policy to block the Topics API on one page, this won't affect other pages.
> 
> You can also control which third parties have access to topics on your page by using the `Permissions-Policy` header to control third-party access to the Topics API. As parameters to the header, use `self` and any domains you would like to allow access to the API. For example, to completely disable use of the Topics API within all browsing contexts except for your own origin and `https://example.com`, set the following HTTP response header:
> 
> ```text
> Permissions-Policy: browsing-topics=(self "https://example.com")
> ```


