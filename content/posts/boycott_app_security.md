+++
title = "Privacy breakdown of three recent boycott apps"
date  = 2024-02-29

[taxonomies]
tags  = ["post", "security", "privacy", "activism"]
+++

> **Super short TLDR:** I looked at three barcode-scanning boycott apps. "Boycat" and "Boycott for Peace" have reasonable network traces, but loading images exposes your IP to third parties. "No Thanks" has no Privacy Policy, falsely claims to collect no data, and makes numerous unnecessary calls to Facebook and Google.

---

> **Longer TLDR:**
> 
> The iOS versions of these apps were analyzed in February.
>
> ["Boycat"](https://apps.apple.com/us/app/boycott-for-peace/id6472617524) and ["Boycott for Peace"](https://apps.apple.com/us/app/boycott-for-peace/id6472617524) expose your IPs to some third parties to load images, and have similar features. Both are good and easy to recommend, but Boycat has an overly-broad Privacy Policy and a Terms of Service which includes Arbitration.
> 
> Boycat has aims to be a more general purpose boycotting platform, whereas Boycott for Peace is focused singularly on the BDS movement.
> 
> "No Thanks" makes many tracking calls to Facebook and Google and has integrated advertisements. It offers no compelling features over Boycat or Boycott for Peace, and cannot be recommended. Further, it does not have a working link to a Privacy Policy, and falsely claims "No Data Collected" on the iOS app store.

---

Boycotting a corporation is hard to do when there are so many corporations to keep track of.

There are a number of apps coming out lately which promise to make it easier to participate [in BDS boycotts](https://en.wikipedia.org/wiki/Boycott,_Divestment_and_Sanctions). Thirty-seven US states [have passed anti-BDS laws](https://en.wikipedia.org/wiki/Anti-BDS_laws) alongside Canada, France, Germany, Spain, and the UK. Given the US Government's long history of using apps to spy, [such as with the U.S. Military buying location data from Muslim prayer and Quran apps](https://www.vice.com/en/article/jgqm5x/us-military-location-data-xmode-locate-x),

I'm one of those big skeptical privacy freaks. Apps, either through malice or unawareness, can leak huge amounts of data that can later be used to surveil and suppress people.

So I decided to take a look into these apps. I used mitmproxy to inspect and modify traffic between the app and the server for this analysis, but I did not touch the server or internal code in any other way.

<!-- more -->


---

# Boycat: My personal favorite

> **TLDR:** Boycat has the cleanest network stack of these all, and has the best UI/UX to boot. It requires no email to scan, only to recommend alternatives or report problems. It does not ping to Google or Facebook or other adware companies or report location data.
> 
> There are a few minor issues: The ToS has an arbitration clause and the Privacy Policy is broader than the app network stack implies, the alternatives are vulnerable to vote manipulation, and the app makes requests directly to third-parties like Walmart to load images.
>
> There is also a minor security flaw that allows someone to exploit the alternatives voting system, but this should not harm end-user privacy.


[Boycat](https://apps.apple.com/us/app/boycat/id6474510742) is one of the many new barcode-scanning apps meant to make boycotting easier. Initially aimed at the BDS boycotts, it's promising to be useful for any particular boycott campaign.

This is going to be a dry post about pretty rote security analysis. This post only looks at the legal promises (in the Terms of Service and Privacy Policy), as well as the actual network calls thea pp makes, but I can't say anything else about what goes on inside the app or the servers it talks to.

I reached out to the dev on 2024-Feb-21, detailing two issues with the Terms of Service and Privacy Policy, the IP-leakage to third parties when loading images, and an exploit allowing technical users to manipulate votes. 

## Suggestions to the devs

1. Currently, devices request images directly from third-party servers, like `walmartimages.com`. Consider proxying images, so that users IP address is not leaked to third parties.
2. The Terms of Service has a mandatory arbitration clause with no opt-out provision. Consider adding an opt-out provision.
3. The Privacy Policy is overly broad. The app does not collect as much data as the Privacy Policy states.
4. Users can recommend arbitrary alternatives and manipulate the vote counts. The details are not published in this blog, but details on how to reproduce and fix this bug were sent to the app creator.


## The Boycat legal promises

> **TLDR:** Boycat's Privacy Policy has the standard red-flags, including the sale of location data to third-parties. The ToS has a mandatory arbitration clause with no opt-out, but the developer says an opt-out is coming. Until arbitration is opt-out, this is "proceed with caution". But the app thankfully is far less invasive than its ToS and Privacy Policy suggests.

Boycat on the iOS app store has these "privacy card" disclaimers, which are never reviewed by Apple:

- Data Linked to You: Identifiers, Usage Data, and Diagnostics
- Data Not Linked to You: Usage Data

The [Privacy Policy](https://www.boycat.io/privacy-policy) is brief and, according to the founder, ["was a generic template from legal".](https://twitter.com/adilbuilds/status/1759758998449107363) 

- Personal Identification Information: Collect name, email address, and "other contact details"
- Usage data (frequency, navigation paths)
- Device information (model, OS, unique IDs, IP.)
- Location Data
- Cookies and other tracking information, including for advertisements.
- Third-party data.

The Privacy Policy permits to sell data, including for marketing and advertising.

To make things worse, [the Terms of Service](https://www.boycat.io/terms-of-service) has a mandatory arbitration clause. These are widely upheld in the United States and are a red flag for any consumer. *(P.S.! I maintain [arbitration opt-out templates](https://github.com/lynnpepin/arbitration-opt-out-templates/) to make it easier to opt out of these. If Boycat adds an arbitration opt-out, I'll update this at the earliest convenience.)

## Boycat network activity

> **TLDR:** This app has a very clean network trace. The only concerning things are calls to third-parties like Walmart Images. 

![[IMG_3604.png]]

There are **no network pings** when you start the app, which is fantastic, and the app's UI is very simple. There are three things you can do in this app:

1. Scan items
2. Make an account
3. Report a problem or provide an alternative


### What happens when you scan an item?

> **TLDR:** This app uses Supabase and the network call stack is clean, with HTTP calls only made when necessary. One call to scan the barcode, and another call to load the image of the product. This call to load the image is concerning, since it pings arbitrary IPs with a user agent from the Boycat app, leaking the users IP to third parties. But otherwise, this is a clean app.
> 
> Besides IP, I could find no location or other usage information transmitted.

I used MITM proxy to dig into the network calls Boycat makes.

> A quick guide on how to use `mitmproxy` to do this yourself (on iOS at least):
> 
> 1. Install and run `mitmproxy` on the host device (i.e. a laptop):
>     1. 1. Download `mitmproxy`: https://mitmproxy.org/
>     2. Run `mitmweb` on the host device
> 2. Connect your iOS device to the host proxy:
>     1. Find your host devices IP (e.g. through network settings). Mine is `192.168.1.4`
>     2. Find the port `mitmproxy` is running on. Default is `8080`.
>     3. Go to WiFi settings on iOS device and manually assign a proxy with said IP and port. (No authentication)
> 3. Install the MITM cert from `mitm.it`:
>     1. Visit `mitm.it` on Safari on the iOS device.
>     2. Click the "Get mitmproxy-ca-cert.pem" to install the profile onto your iPhone.
>     3. Open the "Settings" app, find the "Profile downloaded" icon, and install it.
>     4. From Settings, find the "Certificate Trust Settings" and trust `mitmproxy`.

First, I tried scanning a few things without signing in. Each time, it yielded a predictable and clean set of calls. Scanning that barcode yields a `POST` to `https://tjqnayzkemnkjthmraae.supabase.co/functions/v1/check-barcode-compliance` with a body `{"barcode": "0051500025017"}`, with a bearer token which may operate as an API key. In response, we get

```json
{
    "alternatives": [],
    "boycott": false,
    "brand": "Smucker's",
    "campaign": "doesn't matter for now",
    "category": "Unknown",
    "data_source": "API",
    "image": [
        "https://openfoodfacts-images.s3.eu-west-3.amazonaws.com/data/005/150/002/5017/1.full.jpg",
        "https://openfoodfacts-images.s3.eu-west-3.amazonaws.com/data/005/150/002/5017/3.full.jpg",
        "https://openfoodfacts-images.s3.eu-west-3.amazonaws.com/data/005/150/002/5017/2.full.jpg"
    ],
    "product_id": 63872,
    "signedImage": null,
    "title": "Smucker's Magic Shell Chocolate Fudge Flavor Topping",
    "upc": "0051500025017"
}
```

This is as expected. A list of possible alternatives, a boycott boolean, brand information, etc. The `"campaign": "doesn't matter for now"` is in-line with the apps intentions to allow users to pick a campaign to choose from.

Things get more concerning when the app processes the items under `"image"`. The app makes a `GET` call to `https://openfoodfacts-images.s3.eu-west-3.amazonaws.com/data/005/150/002/5017/1.full.jpg` in this example, but the app also makes calls directly to a variety of other domains, such as `walmartimages.com`. These calls are made with the user agent `boycatfrontend/3 CFNetwork/1492.0.1 Darwin/23.3.0`. Because they are made directly from the phone, this also leaks the users IP address.

I'm going to try to find something which returns `"boycott": true`, so I looked for SodaStream photos on eBay and found one with a very high-resolution barcode. Scanning the SodaStream yielded this body:

```json
{
    "alternatives": [],
    "boycott": true,
    "brand": "Sodastream",
    "campaign": "doesn't matter for now",
    "category": "Home & Garden > Kitchen & Dining > Kitchen Appliances > Soda Makers",
    "image": [
        "http://www.homedepot.com/catalog/productImages/1000/3e/3e6908c3-cfb7-4335-94dd-814f1e7fddac_1000.jpg",
        "http://s7d4.scene7.com/is/image/BonTon/787730?$ibm_large$",
        "http://img.bbystatic.com/BestBuy_US/images/products/9359/9359293_sc.jpg",
        "https://i5.walmartimages.com/asr/75e777ad-bde7-4159-8c6d-05d4a918289a_1.0f8df12830dd17d5568f04bffec69495.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff",
        "http://ecx.images-amazon.com/images/I/41oAuXgrJtL._SL160_.jpg",
        "http://scene7.targetimg1.com/is/image/Target/16271062?wid=1000&hei=1000",
        "http://s7d9.scene7.com/is/image/TheBay/811369007506_main?$PDPLARGE$",
        "http://img1.r10.io/PIC/90759793/0/1/250/90759793.jpg",
        "https://m.media-amazon.com/images/I/41oAuXgrJtL._UL320_.jpg",
        "http://cache.air-n-water.com/images/1613211010-1-l.jpg"
    ],
    "product_id": 4185485,
    "reasoning": "SodaStream is an Israeli company which manufactured its products in Occupied Palestine. Now owned by Pepsico after a $3.2b acquisition. It since moved its factory from the West Bank to main Israel, however is still subject to boycott for its firing of 60 Palestinian workers and dark history.",
    "signedImage": "https://tjqnayzkemnkjthmraae.supabase.co/storage/v1/object/sign/boycat-production/product-images/4185485?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJib3ljYXQtcHJvZHVjdGlvbi9wcm9kdWN0LWltYWdlcy80MTg1NDg1IiwiaWF0IjoxNzA4NTY0OTY4LCJleHAiOjE3MDg1NjUwMjh9._IrOKqZ2j1XQhLbOZXeEScKuY9qofe6_vS6lAa3qPeE",
    "source": "https://bdsmovement.net/news/%E2%80%9Csodastream-still-subject-boycott%E2%80%9D",
    "title": "SodaStream PLAY Starter Kit",
    "upc": "811369007506"
}
```

Nothing surprising or concerning.

### What happens when you sign up?

> **TLDR:** Nothing surprising or concerning. After signing up, a number of calls are made to fetch boycott and alternatives information. They're `POST` calls, but are used like `GET`. It might be a little inefficient, but this is better than most apps out there.


A `POST` call is made to `https://tjqnayzkemnkjthmraae.supabase.co/auth/v1/signup?redirect_to=boycat%3A%2F%2Fverify%2F` with a body like:

```json

{
    "code_challenge": null,
    "code_challenge_method": null,
    "data": {},
    "email": "redacted",
    "gotrue_meta_security": {},
    "password": "redacted"
}
```

This is a standard supabase signup/login form, as evidenced by the `gotrue_meta_security`. Security novices might be surprised to know the password is transmitted unencrypted and unhashed, but that's standard: Passwords are hashed server-side and it's encrypted _within_ the TLS transport tunnel. I can only see it here because I am MITM-ing it. :)


I check my email for a signup confirmation, and voila! Signing-in makes a `POST` call to `https://tjqnayzkemnkjthmraae.supabase.co/auth/v1/token?grant_type=password` with the email and password, and then a number of calls happen.

First, the app makes a call to the `fetch-campaign-data` API `POST https://tjqnayzkemnkjthmraae.supabase.co/functions/v1/fetch-campaign-data HTTP/2.0` which yields the body

```json
{
    "brands": [
        {
            "name": "Acqua Panna",
            "reasoning": "The owner of the Acqua Panna brand, Nestle, owns a controlling stake in Osem. Osem is an Israeli food manufacturer which operates in Occupied Palestine.",
            "source": "https://en.wikipedia.org/wiki/Osem_(company)"
        },
        {
            "name": "Aero",
            "reasoning": "The owner of the Aero brand, Nestle, owns a controlling stake in Osem. Osem is an Israeli food manufacturer which operates in Occupied Palestine.",
            "source": "https://en.wikipedia.org/wiki/Osem_(company)"
        },
        ... and so forth
    ]
}
```

encoding _all_ the brands to boycott. This is only 20kB now, but it's unclear why this data is fetched in advance rather than living in the server-side API. I might be misinterpreting this.

Next is a `POST` call to `https://tjqnayzkemnkjthmraae.supabase.co/functions/v1/fetch-recent-alternatives`  which yields a 7.5kB list of alternatives. This is another thing which seems like it should live server-side.

Then a call to `https://tjqnayzkemnkjthmraae.supabase.co/functions/v1/fetch-recent-no-alternatives` which lists only Pringles, Oreos, and Tide, and then another call to `ttps://tjqnayzkemnkjthmraae.supabase.co/functions/v1/fetch-campaign-data`. Not sure why.



### What happens when you scan an alternative?

> **TLDR:** Nothing surprising or concerning, but it is possible to push alternatives to the top of the leaderboard by modifying network calls. 

The `alternatives` array is empty, but I know of an alternative to SodaStream! I'm a logged in user, so I suggest the "OTE Portable Sparking Water Machine". A POST to search by name, a few GETs from Walmart Images, and a POST to recommend the alternative.

I forgot to get screenshots here, but the call stack was minimal (save for the concerning WalMart requests.)

My suggestion showed up right away, this time, with `alternatives`:

```json
  "alternatives": [
        {
            "barcode": "0679283546361",
            "brand": "OTE",
            "category": "",
            "created_at": "2024-02-22T01:42:08.462881+00:00",
            "id": "c4462ae6-ea2c-4131-a5ee-cf810616b7f9",
            "images": [
                "https://i5.walmartimages.com/asr/dfc15965-9cd4-4957-a0ff-fbd4c1c1b0aa.d8a2dffcdf10e771f616ef72b57ba8c4.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff"
            ],
            "manually_entered": false,
            "num_of_submissions": 1,
            "product_id": 4185485,
            "title": "OTE Portable Sparkling Water Maker",
            "total_votes": 0,
            "verified_status": "NOT_VERIFIED"
        }
    ],
```

I vote it up, and a `POST` to `https://tjqnayzkemnkjthmraae.supabase.co/functions/v1/insert-alternative-vote` is made with the info:

```json
  
{
    "alternative_submissions_id": "redacted-guid",
    "user_id": "redacted-guid",
    "vote_value": 1
}
```

I found it was possible to manipulate the vote count, but I won't explain how in this post. I undid the exploit and let the devs know.


---

# Boycott for Peace: Close second

The app privacy policy reports "Data Not Linked to You" might be collected, and [the privacy policy](https://boycottforpeace.org/privacy-policy/) correctly reports that embedded content from other apps might allow them to collect data from you. It's super straightforward.

## Boycott for Peace's network activity

When you start the ['Boycott for Peace'](https://apps.apple.com/us/app/boycott-for-peace/id6472617524) app, it makes one `GET` call to `https://apps.apple.com/us/app/boycott-for-peace/id6472617524` with a body like

```json
[
    {
        "eventName": "app_started",
        "props": {},
        "sessionId": "170933806435083527",
        "systemProps": {
            "appBuildNumber": "2",
            "appVersion": "1.4.2",
            "isDebug": false,
            "locale": "en",
            "osName": "iOS",
            "osVersion": "17.3.1",
            "sdkVersion": "aptabase-swift@0.3.6"
        },
        "timestamp": "2024-03-02T00:07:44Z"
    }
]
```

as well as a `GET` to `https://apps.apple.com/us/app/boycott-for-peace/id6472617524` which `https://api.howtohelpgaza.org/static/json/w/e7e715a341bfad11b714e97ff62cebd79e509561/w.json` which loads a JSON of brands to boycott and alternatives, with a body that starts with

```json
[
    {
        "alternatives": [
            "Supermarket own brand products, eg. Morrisons",
            "Barr Drinks (owner of Irn Bru)"
        ],
        "category": [
            "drinks"
        ],
        "description": "Soft drink, a distributed internationally by PepsiCo",
        "howToBoycott": [
            "Don't buy 7up products.",
            "Don't sell 7up products",
            "Don't work for the PepsiCo Company"
        ],
        "id": "7up",
        "logo": "https://assets.turbologo.com/blog/en/2020/02/19084627/7up-cover.jpg",
        "name": "7up",
        "reason": "The international distributer of 7up, PepsiCo, bought SodaStream for $3.2bn and owns 50% of Sabra both of which had taken advantage of the Israeli occupation of Palestine.",
        "source": "https://www.bloomberg.com/view/articles/2018-08-22/pepsico-s-sodastream-purchase-is-sweet-news-for-israelis?leadSource=uverify%20wall"
    },
    {
        "alternatives": [
            "Supermarket own brand products, eg. Morrisons",
            "Saka water (from Turkiye)"
        ],
        "category": [
            "drinks"
        ],
        "description": "Acqua Panna is a water brand owned by Nestle.",
        "howToBoycott": [
            "Don't buy Acqua Panna products",
            "Avoid Nestle products until they divest all operations in Occupied Palestine.",
            "Especially avoid any Osem brands such as Sabra and others which can be found via the wikipedia page in the source."
        ],
        "id": "acquapanna",
        "logo": "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Acqua_Panna_logo.svg/513px-Acqua_Panna_logo.svg.png",
        "name": "Acqua Panna",
        "reason": "The owner of the Acqua Panna brand, Nestle, owns a controlling stake in Osem. Osem is an Israeli food manufacturer which operates in Occupied Palestine.",
        "source": "https://en.wikipedia.org/wiki/Osem_(company)"
    },
    ...
```

But as you scroll on the starting 'Brands' pane pf the app, it *loads the logo of each app*. Like Boycat, this exposes your IP to various brands, this one with the user-agent `Boycott/2 CFNetwork/1492.0.1 Darwin/23.3.0`. 

This seems to have a much wider footprint.

When you scan an barcode, it makes a query like `GET https://world.openfoodfacts.org/api/v2/product/0086600709123.json?fields=code,product_name,brands,brands_tags,image_url HTTP/2.0`, with a response body like

```json
{
    "code": "0086600709123",
    "product": {
        "brands": "Bumble Bee",
        "brands_tags": [
            "bumble-bee"
        ],
        "code": "0086600709123",
        "image_url": "https://images.openfoodfacts.org/images/products/008/660/070/9123/front_en.3.400.jpg",
        "product_name": "Bumble Bee protein on the run"
    },
    "status": 1,
    "status_verbose": "product found"
}
```

and then loads the image. It's a bit less complex than BoyCat.

# "NoThanks": Facebook, Google, and no Terms of Service or Privacy Policy

When I opened the app, it made seven calls to `graph.facebook.com`, four to `googleads.g.doubleclick.net`, four to `pagead2.googlesyndication.com`, one to `googletagservices.com`, and then while I was typing this, four more to `googleapis.com` and two more to `googleads.g.doubleclick.net`.

To make matters worse, the app falsely claims "No data collected" on the iOS App Store, and has a broken link to a Privacy Policy at "termly.io", another third party. Visiting that site invokes a binding arbitration agreement.

I'm not going to spend much time analyzing this app. There is no reason for the dev to falsely claim no data is collected.