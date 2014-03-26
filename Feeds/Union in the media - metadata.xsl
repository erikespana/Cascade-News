<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="date-converter" version="1.0" xmlns:date-converter="http://www.hannonhill.com/dateConverter/1.0/" xmlns:xalan="http://xml.apache.org/xalan">
    <xsl:include href="/_Site Support/Formats/xPaths"/>
    <xsl:include href="/_Site Support/Formats/xalan_convertMonthDate"/>
    <xsl:output indent="yes" method="xml"/>
    <!-- Lists all "Union in the Media" stories, in reverse chronological order. -->
    
    <xsl:template match="system-index-block">
        
      
        
        <ul class="post-list post-list-alt">
        <!-- Loop through all stories categorized as 'Union in the News' and having a Start Date -->
        <xsl:for-each select="$in-the-media">
            <!-- ...in descending ordered by start-date -->
            <xsl:sort order="descending" select="start-date"/>
            <li>
                <!-- Print publication/media source -->
                <xsl:value-of select="dynamic-metadata[name='source']/value"/>
                <xsl:text>, </xsl:text>
                <!-- Print start date -->
                <xsl:value-of select="date-converter:convertMonthDate(number(start-date))"/><br/>
                <a class="post-title" href="{path}" title="{title} {date-converter:convertMonthDate(number(start-date))}">
                <xsl:value-of select="title"/></a>
                <br/><xsl:value-of select="teaser"/>
            </li>
        </xsl:for-each>
        </ul>
    </xsl:template>
    
</xsl:stylesheet>