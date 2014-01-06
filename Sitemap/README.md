
Creates an [XML sitemap](http://www.union.edu/feeds/sitemaps/reboot.xml), using [http://www.sitemaps.org/protocol.html](http://www.sitemaps.org/protocol.html) (same protocol used by Google, Yahoo, and Bing).

**Google Sitemap 2.vm**
	
	* Tailored for Cascade Server sites that employ a folder + page pair to represent a single page in a website's information architecture.

	* Hard-coded to ignore any URL that starts with /news because Google recommends submitting a separate sitemap for News articles.

	* Only lists published pages and uses the last published date for the <lastmod> field.

	* Flags pages not in `folder/index` form.

    * Currently does not support priority node.

### Concerns ###
You'll have to experiment with how many levels deep to index. You don't want to use too many resources.

### Instructions ###
* Create an Index Block for the Cascade Site to be indexed.
* Create a template called "XML" using **template.xml**.
* Create an "XML" Configuration Set.
* Create an "XML" Content Type.
* Create a page asset using the "XML" Content Type.
    * Assign the Structured Data Block to the default block.
    * Assign **feed-block-aggregator.vm** as the default region.