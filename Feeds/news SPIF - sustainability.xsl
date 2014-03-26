<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:include href="/_Site Support/Formats/xPaths"/>

    <xsl:output indent="yes" method="xml"/>
    
    <!-- start at the system index block level -->
    <xsl:template match="system-index-block">
        <div class="feature-widget-white aside-widget aside-banner-overlap small-slides-outer" style="min-height: none; background-image: url('http://www.union.edu/img/common/pin-bg.png');">
            <div class="feature-header">
                <div class="title">Sustainability News</div>
                <div class="subtitle">Recent Accomplishments</div>
            </div>
        
            <xsl:apply-templates mode="build-callout" select="$sustainability">
                <xsl:sort order="descending" select="start-date"/>
            </xsl:apply-templates>    
        </div>
    </xsl:template>
    
    <xsl:template match="system-page" mode="build-callout">

        <div class="feature-content">
            <a href="{link}" title="{title}">
                <xsl:value-of select="title"/>
            </a>
        </div>

    </xsl:template>
    
</xsl:stylesheet>