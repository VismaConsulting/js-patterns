<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:stk="http://www.enonic.com/cms/xslt/stk">
    
    <xsl:template match="/">
        <h1>High<span>score</span></h1>
        <div>
            <table class="table table-striped" style="font-family: agencyfb;font-size: 40px;color: #626262; text-transform:uppercase;">                
                <xsl:apply-templates select="/result/contents/content" />                 
            </table>
        </div>
    </xsl:template>

    <xsl:template match="content">
        <tr>
            <xsl:attribute name="style">
                <xsl:choose>
                    <xsl:when test="position() = 1">font-size: 2em;</xsl:when> 
                    <xsl:when test="position() = 2">font-size: 1.5em;</xsl:when>
                    <xsl:when test="position() = 3">font-size: 1.25em;</xsl:when>                   
                </xsl:choose>
            </xsl:attribute>
            <td><xsl:value-of select="if(string-length(contentdata/name) > 20) then concat(substring(contentdata/name, 1, 20), '...') else contentdata/name" /></td>
            <td><xsl:value-of select="contentdata/timeused" /></td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>