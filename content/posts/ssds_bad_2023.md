+++
title = "SSDs are bad again. I had many failures in 2023"
date = 2023-12-08

[taxonomies]
tags = ["post"]
+++


> **TLDR:** In 2014, SSDs were unreliable but cool and new. They've become more reliable over the years, but going into 2024, they're showing a streak of unreliability again. I've had three failures in 2023 alone across SSDs and enclosures.
> 
> The worst offenders are SanDisk, Western Digital, Samsung. [Backblaze reports](https://www.backblaze.com/blog/ssd-edition-2023-mid-year-drive-stats-review/) roughly confirm this. See [their full stats page](https://www.backblaze.com/cloud-storage/resources/hard-drive-test-data) here.
> 
> I didn't even know Dell made SSDs, but BackBlaze reports Dell as the lowest failure rate.

<!-- more -->

My first piece of external storage was a 512MB USB 2.0 flash drive, which I made good use of in elementary school.

I made sure to keep backups of everything, everywhere, all the time, until one stressful day in junior year that I lost a 16GB flashdrive. I had hours of homework completed on it, fighting for a competitive GPA-based scholarship where every point mattered. I sobbed having had lost it. My fault for not keeping a copy.

I've fastidiously maintained backups of my backups, ensuring to have no single point of failure (short of a house fire) since then. For these purposes I recommend [SyncThing](https://syncthing.net/), a FOSS tool to sync files between your devices in a peer-to-peer manner.

This paranoid commitment to data integrity finally held up in 2023, the year of *atrocious SSDs.*

I've had the following SSDs and enclosures fail on me in the past year:

- Either the Plugable USB C M.2 NVMe enclosure (B07N48N5GR) or a WD_Black 850 drive.
  - After use, the 850 drive wouldn't respond in any other enclosure, and I wasn't willing to test any drive in the Plugable.
  - There had been reports that the Plugable enclosure fried drives, so I'm inclined to blame the enclosure.
- The Sabrent Utlra Slim USB 3.0 to 2.5 inch SATA aluminum enclosure (B00LS31KQG), which simply stopped reading disks after one use. The disk is still fine:
- The SanDisk 2TB Extreme PRO Portable SSD (B08GV4YYV7), due to problems impacting *every single one of these*

Of these, the greatest betrayal was the SanDisk 2TB Extreme Pro. I had my failure in January 2023, and now (December 2023), people are still suffering failures ([Reddit Feb 2023](https://www.reddit.com/r/DataHoarder/comments/102l844/sandisk_extreme_2tb_vs_samsung_t7_2tb_they_are/j77w8bv/), [The Verge August 2023](https://www.theverge.com/22291828/sandisk-extreme-pro-portable-my-passport-failure-continued), [TomsHardware Nov 2023](https://www.tomshardware.com/news/sandisk-extreme-pro-failures-are-due-to-design-flaw)), despite Western Digital's insistence that it's been fixed. Everything I put on the SanDisk were files I considered "non-critical", but I miss them now. Old photos, homeworks, notes, server logs, and project repositories. 

Everything lost. And Amazon is still selling them.

Now, looking for a new SSD feels like walking a field of landmines. I can't trust SanDisk, I can't trust Western Digital, I can't trust Samsung (who has reported problems with the 870 Evo and 970 Evo and [the 990 especially, per The Verge](https://www.theverge.com/2023/2/7/23589116/samsung-ssd-990-980-pro-m2-health-failing-defective)), and you can't trust Amazon, which is notoriously full of counterfeits.

SSDs were notoriously unreliable a decade ago, and that was a price people accepted for the performance benefits they offered over HHDs. (It was amazing to watch Windows 7 boot in seconds rather than minutes. In 2014, I was proud of my one-minute Ubuntu boot time!).

BackBlaze, famous for reporting their experienced HDD reliability, [has started reporting SSD reliability](https://www.backblaze.com/blog/ssd-edition-2023-mid-year-drive-stats-review/). Their stats confirm a trend others have observed: SSDs over the past few years have had some *bad* design flaws and some *bad* batches.

From what I see, Dell looks like the most reliable SSD manufacturer. I didn't even know Dell made SSDs, but I think I know where I'm going for my next purchase.