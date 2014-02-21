<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="date-converter" version="1.0" xmlns:date-converter="http://www.hannonhill.com/dateConverter/1.0/" xmlns:xalan="http://xml.apache.org/xalan">
    <xsl:include href="/_Site Support/Formats/News/Configuration"/>
    <xsl:include href="/_Site Support/Formats/Common/Output/xalan_convertMonthDateYear"/>
    <xsl:output indent="yes" method="xml"/>
    
    <!-- start at the system index block level -->
    <xsl:template match="system-index-block">

        <ul class="post-list post-list-alt">
        <!-- Loop through every <system-page> element categorized under "Around Campus" -->
        <xsl:for-each select="$announcements">
            <xsl:sort order="descending" select="start-date"/>
            <li>
            <xsl:value-of select="date-converter:convertMonthDateYear(number(start-date))"/><br/>
            <a class="post-title" href="{path}" title="{title} {date-converter:convertMonthDateYear(number(start-date))}">
            <xsl:value-of select="title"/></a>
            <br/><xsl:value-of select="teaser"/>
            </li>
        </xsl:for-each>
        </ul>
        
    </xsl:template>
    
</xsl:stylesheet>