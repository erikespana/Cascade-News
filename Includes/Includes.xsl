<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>

    
    <xsl:template match="/">

        <!-- Include files based on //system-page/link -->
        <xsl:choose>

            <!-- Homepage includes-->
            <xsl:when test="//system-page/link = 'site://reboot/index'">
                <link href="site://reboot/_css/homepage-1.4/homepage.css" media="all" rel="stylesheet" type="text/css"/>
            </xsl:when>

            <!-- Development homepage includes -->
            <xsl:when test="//system-page/link = 'site://development/homepage1.4.1/index'">
                <link href="site://reboot/_css/homepage-1.4/homepage.css" media="all" rel="stylesheet" type="text/css"/>
            </xsl:when>

            <!-- News homepage includes-->
            <xsl:when test="//system-page/link = 'site://news/index'">
                <link href="site://reboot/_css/news-3/news.css" media="all" rel="stylesheet" type="text/css"/>
                <!-- Social Media Sprites CSS -->
                <link href="site://reboot/_css/news-3/socialSpritesStyle.css" media="all" rel="stylesheet" type="text/css"/>
                <!-- Tabs code -->
                <link charset="utf-8" href="site://reboot/_css/news-3/tabs.css" media="screen" rel="stylesheet" type="text/css"/>
                <!-- FlexSlider -->
                <link href="site://reboot/_css/flexslider.css" media="all" rel="stylesheet" type="text/css"/>
                <script defer="defer" src="site://reboot/_scripts/flexslider/jquery.flexslider.js" type="text/javascript">
                </script>
                <script defer="defer" src="site://reboot/_scripts/flexslider/jquery.flexslider-min.js" type="text/javascript">
                </script>
            </xsl:when>

            <!-- Includes for all pages -->
            <xsl:otherwise>
                <link href="site://reboot/_css/styles.css" media="all" rel="stylesheet" type="text/css"/>
                <link href="site://reboot/_css/print.css" media="print" rel="stylesheet" type="text/css"/>
            </xsl:otherwise>
        </xsl:choose>
    
        <!--
            jQuery 1.6.4
            The recommended version is the minified version. Requires less client-side processing time to unpack the code.
            http://docs.jquery.com/Downloading_jQuery
        -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

        <!-- Includes for Google analytics, Site Analyze -->
        [system-view:external]
        <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-2830264-1']);
          _gaq.push(['_setDomainName', '.union.edu']);
          _gaq.push(['_setAllowHash', false]);
          _gaq.push(['_trackPageview']);

          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
        </script>
        
         <script src="http://us1.siteimprove.com/js/siteanalyze_66357286.js" type="text/javascript"></script>
        [/system-view:external]

        <!-- Select the system-page context -->
        <xsl:apply-templates select="system-index-block/calling-page/system-page"/>

    </xsl:template>


    <xsl:template match="system-page">

        <!-- Fancy box photo gallery includes (news) -->
        <xsl:choose>
            <xsl:when test="dynamic-metadata[name='flickrsetID']/value != ''">
                <xsl:call-template name="newsPhotoGallery"/>
            </xsl:when>
            <xsl:when test="system-data-structure/gallery/photo/path != '/'">
                <xsl:call-template name="newsPhotoGallery"/>
            </xsl:when>
        </xsl:choose>


        <!-- Data Definition includes -->
        <xsl:apply-templates select="system-data-structure/includes"/>

    </xsl:template>        

    
    <!-- Data Definition includes -->
    <xsl:template match="includes"> 
         
        <xsl:if test="supersleight/value = 'Yes'"> 
            <!--
                Supersleight jQuery Plugin
                http://allinthehead.com/retro/338/supersleight-jquery-plugin
                Getting PNG transparency working nicely in IE6.
            -->
            <script src="site://reboot/_scripts/supersleight.plugin.js" type="text/javascript"></script>
        </xsl:if>
        
    
        <xsl:choose>
            <!--
                jQuery UI 1.8.2
                Widget and interaction library.
                http://jqueryui.com
            -->
            <xsl:when test="ui = 'mstoner'">

                <link href="site://reboot/_scripts/jq-base/ui.tabs.css" media="all" rel="stylesheet" type="text/css"/>
            
            </xsl:when>
            <xsl:when test="ui = 'accordion'">

                <link charset="utf-8" href="site://reboot/_css/custom-theme/jquery-ui-1.8.14.custom.css" media="screen" rel="stylesheet" type="text/css"/>

            </xsl:when>
        </xsl:choose>

        <xsl:if test="ui != 'none'">
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js" type="text/javascript"></script>
        </xsl:if>
    
    
        <xsl:if test="textboxLabels/value = 'Yes'">
            <!--
                Set textboxes to automatically add the 'label' text value based on the title attribute.
            -->
            <script src="site://reboot/_scripts/global.js" type="text/javascript"></script>
        
        </xsl:if>
        
    
        <xsl:if test="cycle/value = 'Yes'">
            <!--
                jQuery Cycle Plugin
                Slideshow plugin that provides the "cycle" method.
                http://jquery.malsup.com/cycle/
            -->
            <script src="site://reboot/_scripts/jquery.cycle.all.js" type="text/javascript"></script>

        </xsl:if>

        <xsl:if test="prettyPhoto/value = 'Yes'">
            <!--
                jQuery prettyPhoto Plugin
            -->
            <link charset="utf-8" href="/_css/prettyPhoto.css" media="screen" rel="stylesheet" type="text/css"/>
            <script charset="utf-8" src="/_scripts/jquery.prettyPhoto.js" type="text/javascript"></script>

        </xsl:if>
        

        <xsl:if test="googleMapsApi/value = 'Yes'">
            <!--
                Google Maps API
            -->
            <link href="site://reboot/_css/google-maps/residence-halls.css" rel="stylesheet" type="text/css"/>
            <script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
        </xsl:if>

        <xsl:apply-templates select="googleMapsBanner"/>        

        <xsl:if test="flicwidget/value = 'Yes'">
            <!--
               Flickr Side Widget
            -->
   
            <script src="/_scripts/flickr/jflickrfeed.min.js" type="text/javascript"></script>
            <script src="/_scripts/flickr/setup.js" type="text/javascript"></script>
        </xsl:if>
        
        <xsl:if test="tweet/value = 'Yes'">
            <link href="site://reboot/_css/tweets/jquery.tweet.css" rel="stylesheet"/>
            <script src="site://reboot/admissions/paths-old/js/twitter/jquery.tweet.js" type="text/javascript"></script>
        </xsl:if>
        
        <xsl:if test="tweet-homepage/value = 'Yes'">
            <link href="site://reboot/_css/tweets/jquery.tweet.homepage.css" rel="stylesheet"/>
            <!--<script src="site://reboot/_scripts/tweets/jquery.tweet.js" type="text/javascript"></script>
            <script type="text/javascript">
                jQuery(function($){
                    $(".tweet").tweet({
                        username: "UnionCollegeNY",
                        join_text: "auto",
                        avatar_size: 0,
                        count: 1,
                        auto_join_text_ed: "we",
                        auto_join_text_ing: "we were",
                        auto_join_text_reply: "",
                        auto_join_text_url: "we were checking out",
                        loading_text: "loading tweets..."
                    });
                });
            </script> -->
        </xsl:if>

    </xsl:template>

    <!-- Fancy box photo gallery includes (news) -->
    <xsl:template name="newsPhotoGallery">
        <!--
            jQuery Fancybox Plugin
        -->
        <script src="site://reboot/_scripts/fancybox/jquery.mousewheel-3.0.4.pack.js" type="text/javascript"></script>
        <script src="site://reboot/_scripts/fancybox/jquery.fancybox-1.3.2.js" type="text/javascript"></script>
        <link href="site://reboot/_scripts/fancybox/jquery.fancybox-1.3.2.css" media="screen" rel="stylesheet" type="text/css"/>
    </xsl:template>


    <xsl:template match="googleMapsBanner">
        <xsl:if test="javascript/value = 'Yes'">
            <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAQIxePwBQGUzr52eMhLIPFPf2MKCTlpQE&amp;sensor=false" type="text/javascript">
            </script>
            <script type="text/javascript">
                window.onload = function initialize() {
                    var myLatlng = new google.maps.LatLng(<xsl:value-of select="lat"/>, <xsl:value-of select="long"/>);
                    var myOptions = {
                        zoom: <xsl:value-of select="zoom"/>,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP,
                        mapTypeControl: false,
                        streetViewControl: false,
                    }
                    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                    var image = 'http://www.union.edu/img/google-maps/icons/google-maps.png';
                    var myLatLng = new google.maps.LatLng(<xsl:value-of select="lat"/>, <xsl:value-of select="long"/>);
                    var beachMarker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        icon: image
                    });
                }
            </script>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>