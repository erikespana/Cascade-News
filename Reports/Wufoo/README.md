# WuFoo Forms #

#### Summary ####
 Generates an inventory of Wufoo forms and their corresponding notification email addresses, listed in chronological order.
 The report shows each form's:
* Title
* Creation date
* Email address(es) setup to receive form submission alerts.

#### Requirements ####
* Cascade Server 6.10+ with Velocity 1.7
* A [Wufoo.com](http://wufoo.com) account

#### Setup #### 
* Visit https://{subdomain}.wufoo.com/api/v3/forms.xml (replace {subdomain} with your Wufoo account subdomain). Learn more about the [Wufoo Forms API](http://help.wufoo.com/articles/en_US/SurveyMonkeyArticleType/The-Forms-API).
* View the source and copy it into a new XML block in your Cascade Server instance.
* Attach it to a template region.
* Attach either forms.vm or forms-count.vm to the same region.

* **forms.vm**
	
	Generates a 3-column HTML table that lists the title, creation date and email addresses setup to receive notifications for each form.

* **forms-count.vm**
	Returns the total number of forms.