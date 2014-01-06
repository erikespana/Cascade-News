# Google Site Map #

* **google-sitemap.vm**
	
	* Creates an XML sitemap, using [http://www.sitemaps.org/protocol.html](http://www.sitemaps.org/protocol.html) (same protocol used by Google, Yahoo, and Bing)

    * Tailored for Cascade Server setups that employ a folder + index asset pair to represent a single page in a website's information architecture.

    * Currently does not include the priority node

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