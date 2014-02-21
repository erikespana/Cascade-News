<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="date-converter" version="1.0" xmlns:date-converter="http://www.hannonhill.com/dateConverter/1.0/" xmlns:xalan="http://xml.apache.org/xalan">
    <xsl:include href="/_Site Support/Formats/Common/Output/xalan_convertMonthDate"/>
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

    <!-- Start at the system-index-block node -->
    <xsl:template match="system-index-block">
            <!-- Processes each year folder (ie: 2011, 2010, etc..) in document order -->
            <xsl:apply-templates mode="year" select="system-folder"/>
    </xsl:template>
    
    <xsl:template match="system-folder" mode="year">
        <!-- Display the System Name of the year folder -->
        <p><strong><xsl:value-of select="name"/></strong></p>
        <!-- Process this year folder's month folders (ie: 01, 02, .. 12) in document order -->
        <ul class="post-list post-list-alt">
            <xsl:apply-templates mode="month" select="system-folder"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="system-folder" mode="month">           
        <!-- Display the month folder's Display Name -->
        <!-- first, make sure it's a month folder by checking the System Name -->
        <xsl:if test="(name = '01') or (name = '02') or (name = '03') or        (name = '04') or (name = '05') or (name = '06') or        (name = '07') or (name = '08') or (name = '09') or        (name = '10') or (name = '11') or (name = '12')">
            <li>
                <a href="{path}/index" title="{display-name} {../name}">
                    <!-- Print the month... -->
                    <xsl:value-of select="display-name"/>
                </a>
            </li>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>