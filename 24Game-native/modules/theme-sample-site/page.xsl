<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:stk="http://www.enonic.com/cms/xslt/stk">
    
    <xsl:import href="/modules/library-stk/stk-variables.xsl"/>
    <xsl:import href="/modules/library-stk/region.xsl"/>
    <xsl:import href="/modules/library-stk/head.xsl"/>
    <xsl:import href="/modules/library-stk/accessibility.xsl"/>    
    <xsl:import href="/modules/library-stk/navigation.xsl"/>
    <xsl:import href="/modules/library-stk/analytics.xsl"/>    
    <xsl:import href="/modules/library-stk/system.xsl"/>   

    
    <!-- HTML 5 doctype -->
    <xsl:output doctype-system="about:legacy-compat" method="xhtml" encoding="utf-8" indent="no" omit-xml-declaration="yes" include-content-type="no"/>
    
    <!-- page type -->
    <!-- For multiple layouts on one site. Various layouts can be configured in theme.xml, each with a different 'name' attribute on the 'layout' element. -->
    <xsl:param name="layout" as="xs:string" select="'default'"/>
    
    <!-- regions -->
    <xsl:param name="north">
        <type>region</type>
    </xsl:param>
    <xsl:param name="west">
        <type>region</type>
    </xsl:param>
    <xsl:param name="center">
        <type>region</type>
    </xsl:param>
    <xsl:param name="east">
        <type>region</type>
    </xsl:param>
    <xsl:param name="south">
        <type>region</type>
    </xsl:param>
    
    <!-- Select template based on current device -->
    <xsl:template match="/">
        <!-- Run config check to make sure everything is OK -->
        <xsl:variable name="config-status" select="stk:system.check-config()"/>
        <xsl:choose>
            <xsl:when test="$config-status/node()">
                <xsl:copy-of select="$config-status"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="desktop"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Desktop template -->
    <xsl:template name="desktop">
        <html lang="{$stk:language}">
            <head>
                <title>
                    <xsl:value-of select="stk:navigation.get-menuitem-name($stk:current-resource)"/>
                    <xsl:value-of select="concat(' - ', $stk:site-name)"/>
                </title>
                <link rel="shortcut icon" type="image/x-icon" href="{portal:createResourceUrl(concat($stk:theme-public, '/images/all/favicon.ico'))}"/>
                <xsl:call-template name="stk:head.create-metadata"/>
                <xsl:call-template name="stk:head.create-css"/>
                <xsl:call-template name="stk:head.create-js"/>
                
                <xsl:call-template name="stk:region.create-css">
                    <xsl:with-param name="layout" select="$layout"/>
                </xsl:call-template>
            </head>
            <body>
                <div id="" class="container"> 

                    <!-- Renders all regions defined in config -->
                    <xsl:call-template name="stk:region.create">
                        <xsl:with-param name="layout" select="$layout" as="xs:string"/>
                    </xsl:call-template>    

                    <div style="margin-top: 50px;">
                        <img src="{portal:createResourceUrl('/_public/css/img/visma-logo.png')}" width="250px" style="float: right;" />
                        <span class="signature" style="font-family: agencyfb; color: #626262;">
                            Visma Consulting 2013
                        </span>
                    </div>                    
                </div>
         
            </body>
        </html>
    </xsl:template>   
    
    
</xsl:stylesheet>
