<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="date-converter" version="1.0" xmlns:date-converter="http://www.hannonhill.com/dateConverter/1.0/" xmlns:xalan="http://xml.apache.org/xalan">
    <xsl:include href="/_Site Support/Formats/xPaths"/>
    <xsl:include href="site://reboot/_Site Support/Formats/Common/Output/xalan_convertMonthDate"/>
    <xsl:include href="/_Site Support/Formats/Library-using-metadata"/>
    <xsl:output indent="yes" method="xml"/>
    
    <!-- This XSLT format displays all stories ordered by:
            1. year folder
            2. month folder
            3. within month folders, sort by date field
            4. subsort by created-on field
            
        Example:
        /articles
                /2010
                    /05
                        /article    Get Ready for ReUnion 2010
                    /09
                        /article4   Aug 30      Class of 2014 set to begin their...     Around Campus
                        /article2   Sept 7      216th Convocation marks...
                        /notables   Sept 10     New Notables exhibit opens in Schaffer
                        /article3   Sept 13     Albany native leads high-seas rescue    Union in the News
                        /constitu   Sept 15     Constitutional Rights, Human Rights
                        /article1   Error       This is the title
                        /israel-a   Sept 16     Student named Israel advocacy intern
    -->
    
    <!-- start at the system index block level -->
    <xsl:template match="system-index-block">
    <p>
    <a href="#news">News</a> | <a href="#in-the-media">Union in the Media</a> | <a href="#announcements">Announcements</a>
    </p>
    
    
        <!-- traverse through all the system folders in descending order -->
        <a name="news"></a>
        <h3>News</h3>
        <ul class="post-list post-list-alt">
            <xsl:apply-templates mode="release" select="$current-month-folder-stories">
                <xsl:sort order="descending"/>
            </xsl:apply-templates>
        </ul>
        <a name="in-the-media"></a>
        <h3>Union in the Media</h3>
        <ul class="post-list post-list-alt">
            <xsl:apply-templates mode="in-the-news" select="$current-month-folder-stories">
                <xsl:sort order="descending"/>
            </xsl:apply-templates>
        </ul>
        <a name="announcements"></a>
        <h3>Announcements</h3>
        <ul class="post-list post-list-alt">
            <xsl:apply-templates mode="campus" select="$current-month-folder-stories">
                <xsl:sort order="descending"/>
            </xsl:apply-templates>
        </ul>
    </xsl:template>
    
</xsl:stylesheet>