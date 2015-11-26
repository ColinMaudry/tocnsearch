<?xml version="1.0"?>
<!-- 
  This file is part of the DITA Open Toolkit project hosted on
  Sourceforge.net. See the accompanying license.txt file for
  applicable licenses.

  Copyright Shawn McKenzie, 2007. All Rights Reserved.

  Created by Robert Anderson August 2011, based on the sample
  frameset distributed with the original samples. Minor udpates:
  - Grab title of the map as the title
  - Update contentwin to use the first topic

  This is intended to create an initial, sample frameset when
  one is not already provided. Long term, users may wish to create
  a stable frameset using local styles and organization.
  -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
  <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
  <xsl:variable name="msgprefix">DOTX</xsl:variable>

  <xsl:output method="html"
              encoding="UTF-8"
              indent="no"
              doctype-system="about:legacy-compat"
              omit-xml-declaration="yes"/>  

  <xsl:param name="CSSPATH"/>
  <xsl:param name="OUTEXT" select="'.html'"/>

  <xsl:variable name="firsttopic">
    <xsl:variable name="f" select="/*/*[contains(@class, ' map/topicref ')][1]/descendant-or-self::*[@href][not(@processing-role='resource-only')]"/>
    <xsl:choose>
      <xsl:when test="$f">
        <xsl:choose>
          <xsl:when test="not($f[1]/@format) or $f[1]/@format = 'dita'">
            <xsl:call-template name="replace-extension">
              <xsl:with-param name="filename" select="$f[1]/@href"/>
              <xsl:with-param name="extension" select="$OUTEXT"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$f[1]/@href"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="f" select="/*/descendant-or-self::*[@href][not(@processing-role='resource-only')]"/>
        <xsl:choose>
          <xsl:when test="not($f[1]/@format) or $f[1]/@format = 'dita'">
            <xsl:call-template name="replace-extension">
              <xsl:with-param name="filename" select="$f[1]/@href"/>
              <xsl:with-param name="extension" select="$OUTEXT"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$f[1]/@href"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="firsttopicAsHtml" select="$firsttopic"/>
  

  <xsl:template match="/">
    <html class="webhelp">
      <head>
        <title>
          <xsl:choose>
            <xsl:when test="/*/*[contains(@class,' topic/title ')]">
              <xsl:value-of select="normalize-space(/*/*[contains(@class,' topic/title ')])"/>
            </xsl:when>
            <xsl:when test="/*/@title">
              <xsl:value-of select="normalize-space(/*/@title)"/>
            </xsl:when>
          </xsl:choose>
        </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <xsl:choose>
          <xsl:when test="$CSSPATH!=''">
            <link rel="stylesheet" type="text/css" href="concat($CSSPATH,'commonltr.css')"/>
          </xsl:when>
          <xsl:otherwise>
            <link rel="stylesheet" type="text/css" href="commonltr.css"/>
          </xsl:otherwise>
        </xsl:choose>
        <style type="text/css">
          
         /* So little code that I don't think it was worth created a new CSS file.*/
          
          .webhelp {
          height:100%;
          }
          .webhelp > header {
          background-color:#b0d4ff;
          height:50px;
          }
          
          /* iframes */
          
          iframe {
          border:none;
          height:100%;
          }
        </style>
        <link rel="stylesheet" type="text/css" href="css/custom.css"/>
      </head>
      <body class="webhelp">
        <header height="50px" width="100%">
          <!-- Banner content goes here -->
        </header>
        <iframe class="col-md-4 col-lg-3" name="tocwin" src="html/tocnav.html"/>
        <iframe class="col-md-8 col-lg-9" name="contentwin" src="{$firsttopicAsHtml}"/>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
