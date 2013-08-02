Removed News & Events.

# Cascade Publish Sets #

#### Summary ####
 We're using [cron expressions](http://www.quartz-scheduler.org/documentation/quartz-1.x/tutorials/crontrigger) to fine-tune our scheduled web updates. Here's a list of different schedules and their corresponding cron expressions (in parentheses):

Update: During the summer, these pages are updated at 10:01 every weekday (0 1 10 ? * MON-FRI).
During the academic year, they're updated every 15 minutes, starting at 1 minute past the hour (0 1/15 * ? * SUN-SAT).
* [/admissions/index.php](http://www.union.edu/admissions/)
* [/admissions/blogs/index.php](http://www.union.edu/admissions/blogs/)
* [/admissions/applicant_portal/sidebars/login.php]

This page is refreshed on the 1st of each month at 5:30 pm (0 30 17 1 * ?):

* [/news/stories/index.php](http://www.union.edu/news/stories/)

These pages republish weekdays at 5:30 pm (0 30 17 ? * MON-FRI):

* [news/in-the-media.php](http://www.union.edu/news/in-the-media.php)
* [news/announcements.php](http://www.union.edu/news/announcements.php)

These web pages are updated every hour, between 9:30 am & 5:30 pm, on weekdays (0 30 9-17 ? * MON-FRI):

* [Alumni news](http://www.union.edu/news/alumni.php)
* [Faculty/Staff news](http://www.union.edu/news/faculty-staff.php)
* [Student news](http://www.union.edu/news/students.php)
* The current month's news archive (e.g. /news/stories/2013/04/index.php)

These pages are updated at the top of each hour, between 9 am & 6 pm, on weekdays (0 0 9-18 ? * MON-FRI):

* [Alumni gateway](http://www.union.edu/alumni/)
* [Alumni events](http://www.union.edu/alumni/events/index.php)
* [Becker special events](http://www.union.edu/offices/career/students/events/)
* [Employment Opportunities](http://www.union.edu/offices/human-resources/jobs/)

#### These pages get updated on a simple schedule and don't require a cron expression: ####

Updated every day at 5 pm:

* [Admissions Open-Houses](http://www.union.edu/admissions/visit/open-houses/)

Updated every day at 3 am:

* [Admissions in Your Area](http://www.union.edu/admissions/in-your-area/)