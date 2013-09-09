## Majors, Minors, and Academic Programs ##

### Majors ###

* Uses Kurogo's [Content Module](https://modolabs.jira.com/wiki/display/KDOC/Content+Module) to list information about Union's majors, minors and programs.
* Assumes each Major corresponds to a Cascade page and that all pages are part of the same Content Type.

#### Summary ####
* 1. Majors, Minors and Programs links
* 2. List all 44 majors
* 3. For each major, display the Content Introduction, Content Copy, Contact Info and Outcome data.

#### Requirements ####
* Cascade Server 6.10+ with Velocity 1.7
* Assumes majors can be indexed by a unique content type.
* Kurogo 1.4.1

#### Ingredients ####
* Index Block (content type) with:
** Regular Content (display-name, path)
** System Metadata
** User metadata
* 
* Attach the block/format to a page region that generates the feeds-major.ini file.
* Attach forms.vm or forms-count.vm to the same region as the XML block.

#### majors.vm ####
	
* Generates a feeds.ini file for a grouped list of all majors.

https://modolabs.jira.com/wiki/display/KDOC/Content+Module