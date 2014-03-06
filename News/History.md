March 5, 2014
* Switched site://reboot/news/index to 'News Hub 4' Content Type.
* Applied site:/API/.../Includes.xsl to the '10-HEAD' region at the template level.
 
February 24, 2014

* Created news:/_Site Support/Formats/news SPIF - sustainability
* Attached 'news:/.../Stories - 100 most recent' and XSLT format to /campus/community/sustainability/index SPIF-RIGHT-COLUMN region.
* Created news:/_Site Support/Formats/news SPIF - volunteering
* Attached 'news:/.../Stories - 100 most recent' and XSLT format to /campus/community/volunteer/index SPIF-RIGHT-COLUMNTWO region.

February 21, 2014

* Bulk changed August 2011 stories to Story 2011 content type (8)
* Bulk changed September 2011 stories to Story 2011 content type (29)
* Bulk changed October 2011 stories to Story 2011 content type (36)
* Bulk changed November 2011 stories to Story 2011 content type (19)
* Bulk changed December 2011 stories to Story 2011 content type (7)
* Created 'Campus' template (copy of 'News Home mStoner')
* Created 'Campus' configuration set (copy of 'News Home mStoner')
* Created 'Campus' content type (copy of 'News Home mStoner')

February 20, 2014

* Created Story 2011 content type (copy of 'Story') to reduce size of main Story index.
* Created Story 2011 index block.

* Added region 'RECENTHEADLINES-2011' to announcements template.
* Bulk changed January 2011 stories to Story 2011 content type (23)
* Bulk changed February 2011 stories to Story 2011 content type (24)
* Bulk changed March 2011 stories to Story 2011 content type (19)
* Bulk changed April 2011 stories to Story 2011 content type (33)
* Bulk changed May 2011 stories to Story 2011 content type (34)
* Bulk changed June 2011 stories to Story 2011 content type (18)
* Bulk changed July 2011 stories to Story 2011 content type (?)

February 19, 2014

* Limited index block for News RSS feed to 300 Max Rendered Assets. Reduced rendering time from red (2697 ms) to orange (413ms). `news:/.../Blocks/Index/Content Type/Stories inline page xml`

February 10, 2014
* Added "Add to website" field, to the news data definition, enabling news feeds to those websites.

January 7, 2011
* Archive pages load much faster in Cascade by moving _Category_ and _Display in Recent Headlines_ [from the data definition to metadata](http://www.hannonhill.com/news/conference/2010/videos/Spread-the-News.html).
* Replaced RSS link on category pages with _<a system-page-output="rss">...</a>_.

January 4, 2011:
* Photos can be left or right aligned in a story.
* The publication sources, listed in NetNews, have been added to Cascade.

December 22, 2010:
* Uploaded photos are now resized automatically, using Cascade's [Image Resizer plugin](http://www.hannonhill.com/kb/Asset-Factory/available-plug-ins/image-resizer-plug-in.html), and renamed automatically, using the System Name Normalizer plugin.
* Stories are now named automatically, using Cascade's [Title to System Name plugin](http://www.hannonhill.com/kb/Asset-Factory/available-plug-ins/title-to-system-name-plug-in.html).

December 15, 2010: Fixed error when creating a new story.

November 29, 2010: Fixed RSS link bug.

November 23, 2010: Added "Subscribe to News" link to left navigation. Also added the RSS icon to Archives page.

November 22, 2010
* Added "more news" to the bottom of Recent Headlines
* Created monthly archive pages. E.g. http://www.union.edu/news/stories/2011/11/index.php
* Created an archive page for all news (i.e.: News, Union in the News, Around Campus), organized by month. E.g. http://www.union.edu/news/stories/index.php

October 15, 2010
* You can add photo galleries to stories. E.g. http://www.union.edu/news/stories/2010/09/27-critical-stitch.php

September 13, 2010
* You can break-up the text of a long story with multiple images.
http://www.union.edu/news/stories/2010/10/05-lgbtq-rally.php
* You can embed video in stories.
http://www.union.edu/news/stories/2010/11/04-cirqueperforms.php
* New "Around Campus" category is for faculty stories
http://www.union.edu/news/around-campus.php
* The "Teaser" field is similar to "subhead" and used for RSS feeds.
* Stories about upcoming events can disappear after the event has past: 
http://www.union.edu/news/stories/2010/10/21-endoffeminism.php
* Consider pulling stories from Around Campus for the Faculty/Staff gateway
* There should be a link to News from each gateway feeds
http://www.union.edu/news/faculty-staff.php
* Feature stories won't always have good images.
* No longer need to distinguish between news and press releases.
* "Byline" is optional.