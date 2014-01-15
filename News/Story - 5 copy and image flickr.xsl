<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="f exsl" version="1.0" xmlns:exsl="http://exslt.org/common" xmlns:f="http://www.flickr.com/services/api/">
    <xsl:import href="site://reboot/_Site Support/Formats/Flickr/flickr1"/>
    <xsl:include href="/_Site Support/Formats/Library/jQuery"/>
    <xsl:output indent="yes" method="xml"/>

    <!-- Global variables -->
    <xsl:variable name="f:api_key">ea484b69d9da567bab248dc04141f725</xsl:variable>
    
    <!-- xPaths -->
    <xsl:variable name="flickrSetXPath">../dynamic-metadata[name='flickrsetID']/value</xsl:variable>
    <xsl:variable name="galleryPhotoXPath">../gallery/photo/path</xsl:variable>

    <!-- Flickr Sizes
            Large Square:  150 x 150
            Large:         576 x 1024
    -->
       
    <!-- Start XSLT format -->
    <xsl:template match="system-index-block">
        <xsl:apply-templates select="calling-page/system-page/system-data-structure"/>
    </xsl:template>
    
    <!-- Parse data definition -->
    <xsl:template match="system-data-structure">
        
        <!-- loop through all story fields -->
        <xsl:for-each select="//story">
            <xsl:choose>

                <!-- check for single image -->
                <xsl:when test="horizImage/path != '/'">
                    <xsl:call-template name="image-with-caption"/>
                </xsl:when>

                <!-- check for photo gallery images -->
                <xsl:when test="../../dynamic-metadata[name='flickrsetID']/value != '/'">
                    <xsl:call-template name="photoGallery">
                        <xsl:with-param name="source">flickr</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
            
                <!-- check for photo gallery images -->
                <xsl:when test="../gallery/photo/path != '/'">
                    <xsl:call-template name="photoGallery">
                        <xsl:with-param name="source">cascade</xsl:with-param>
                    </xsl:call-template>  
                </xsl:when>

            </xsl:choose>

            <div class="article-text">
                <xsl:copy-of select="copy/node()"/>
            </div>
        </xsl:for-each>
        
    </xsl:template>

    <xsl:template name="photoGallery">
        <xsl:param name="source">cascade</xsl:param>

        <xsl:call-template name="jQuery_storyPhotoGallery"/>
        <div class="feature-widget aside-widget small-slides-outer" style="margin-left:10px; float: right; min-height: none;">
            <div class="feature-header">
                <div class="title">Click image to enlarge:</div>
            </div>
            <div class="feature-content">
                <div class="small-slides">
                    <xsl:choose>
                        <xsl:when test="$source = 'cascade'">
                            <xsl:for-each select="../gallery">
                                <xsl:if test="photo/path != '/'">
                                    <a href="{photo/path}" onclick="_gaq.push(['_trackEvent', 'News Story', 'Click', '{photo/path}']);" rel="photo_gallery_slide" title="{caption}"><img alt="{caption}" src="{photo/path}"/></a>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:when>

                        <xsl:when test="$source = 'flickr'">
                            <xsl:variable name="photoset.rsp">
                                <xsl:call-template name="f:photosets.getPhotos">
                                    <xsl:with-param name="api_key" select="$f:api_key"/>
                                    <xsl:with-param name="photoset_id" select="../../dynamic-metadata[name='flickrsetID']/value"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:value-of select="$photoset.rsp"/>
                            <xsl:apply-templates select="exsl:node-set($photoset.rsp)/*/photoset/photo"/>
                        </xsl:when>
                    </xsl:choose>
                </div>
                <div id="caption"></div>
                <!-- add arrows if there are more than 1 image -->
                <xsl:choose>
                    <xsl:when test="$source = 'cascade'">
                        <xsl:if test="count(../gallery[photo/path != '/']) &gt; 1">
                            <xsl:call-template name="photoGalleryArrows"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$source = 'flickr'">
                        <xsl:call-template name="photoGalleryArrows"/>
                    </xsl:when>
                </xsl:choose>
             </div>
        </div>
    </xsl:template>

    <xsl:template name="photoGalleryArrows">
        <a class="slide-nav-left-ns" href="#" onclick="_gaq.push(['_trackEvent', 'News Story', 'Click', 'Slide Left']);"><img alt="previous" src="/img/common/nav-arrow-left.png"/></a> 
        <a class="slide-nav-right-ns" href="#" onclick="_gaq.push(['_trackEvent', 'News Story', 'Click', 'Slide Right']);"><img alt="next" src="/img/common/nav-arrow-right.png"/></a>
    </xsl:template>

    <!-- For each photo returned by f:photosets.getPhotos, show a flickr photo ID -->
    <xsl:template match="photo">

            <!-- Get the available sizes for a photo.
                 http://www.flickr.com/services/api/flickr.photos.getSizes.html -->
            <xsl:variable name="getSizes">
                <xsl:call-template name="f:photos.getSizes">
                    <xsl:with-param name="api_key" select="$f:api_key"/>
                    <xsl:with-param name="photo_id" select="./@id"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="thumbnail" select="exsl:node-set($getSizes)/*/sizes/size[@label='Medium']/@source"/>
            <xsl:variable name="lightbox" select="exsl:node-set($getSizes)/*/sizes/size[@label='Large']/@source"/>

            <!-- Get information about a photo.
                 http://www.flickr.com/services/api/flickr.photos.getInfo.html -->
            <xsl:variable name="getInfo.rsp">
                <xsl:call-template name="f:photos.getInfo">
                    <xsl:with-param name="api_key" select="$f:api_key"/>
                    <xsl:with-param name="photo_id" select="./@id"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="caption" select="exsl:node-set($getInfo.rsp)/*/photo/description"/>

            <a href="{$lightbox}" rel="photo_gallery_slide" title="{$caption}"><img alt="{$caption}" src="{$lightbox}"/></a>
    </xsl:template>

    <!-- display single image -->
    <xsl:template name="image-with-caption">
        <div class="image-with-caption">
                        
            <!-- add style="float:right;margin-left:10px;margin-right:0px;"> -->
            <xsl:if test="align = 'Right'">
                    <xsl:attribute name="style">float:right;margin-left:10px;margin-right:0px;</xsl:attribute>
            </xsl:if>
            
            <img alt="{caption}" src="{horizImage/link}"/>
            
            <xsl:if test="caption != ''">
                <div class="caption">
                    <xsl:copy-of select="caption/node()"/>
                </div>
            </xsl:if>
        </div>
    </xsl:template>
    
</xsl:stylesheet>