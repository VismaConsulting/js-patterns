<?xml version="1.0" encoding="UTF-8"?>

<!--
    **************************************************
    
    system.xsl
    version: ###VERSION-NUMBER-IS-INSERTED-HERE###
    
    **************************************************
-->

<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:stk="http://www.enonic.com/cms/xslt/stk">    
    
    <xsl:function name="stk:system.get-config-param" as="element()?">
        <xsl:param name="name" as="xs:string"/>
        <xsl:param name="path" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$stk:config-parameter[@name = $name and @path = $path]">
                <xsl:sequence select="$stk:config-parameter[@name = $name and @path = $path][1]"/>
            </xsl:when>
            <xsl:when test="normalize-space($path)">
                <xsl:copy-of select="stk:system.get-config-param($name, substring-before($path, concat('/', tokenize($path, '/')[last()])))"/>
            </xsl:when>
            <xsl:when test="$stk:config-parameter[@name = $name and @path = '/']">
                <xsl:sequence select="$stk:config-parameter[@name = $name and @path = '/'][1]"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="stk:system.check-config" as="element()?">
        <xsl:variable name="check-config-result">
            <xsl:if test="not($stk:config)">
                <li>Config file not set / found</li>
            </xsl:if>
            <xsl:if test="$stk:device-class = 'not-set'">
                <li>Device resolver not set</li>
            </xsl:if>
            <xsl:if test="not($stk:theme-config)">
                <li>Theme config file not set / found</li>
            </xsl:if>
            <xsl:if test="not($stk:theme-device-class)">
                <li>Theme device class not defined</li>
            </xsl:if>
        </xsl:variable>
        
        <xsl:if test="$check-config-result/node()">
            <html>
                <body>
                    <h1>Configuration error</h1>
                    <ul>
                        <xsl:copy-of select="$check-config-result"/>
                    </ul>
                </body>                
            </html>
            
        </xsl:if>
        
        
    </xsl:function>
    

</xsl:stylesheet>
