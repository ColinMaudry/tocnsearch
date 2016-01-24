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
  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="/*/*[contains(@class,' topic/title ')]">
        <xsl:value-of select="normalize-space(/*/*[contains(@class,' topic/title ')])"/>
      </xsl:when>
      <xsl:when test="/*/@title">
        <xsl:value-of select="normalize-space(/*/@title)"/>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

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
          <xsl:value-of select="$title"/>
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
          
         /* So little code that I don't think it was worth creating a new CSS file.*/
          
          .webhelp {
            height:100%;
          }
          .webhelp > header {
           background-color:#b0d4ff;
           height:50px;
          }
          iframe {
            border:none;
            height:100%;
            padding-top:8px;
          }
          .navbar {
            margin-bottom:0;
          }
          
          .webhelp > .container-fluid {
            padding-left:0;
            padding-right:0;
          
            /* Adapt screen height */
            height:calc(100% - 51px);
          }
          
          /* Stick the left hand side frame to the left side of screen*/
          .container-fluid iframe:first-of-type {
            padding-left:4px;
            background-color:rgb(254,254,254);
          }
        </style>
        <link rel="stylesheet" type="text/css" href="css/custom.css"/>
      </head>
      <body class="webhelp">
        <nav class="navbar navbar-default navbar-static-top">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#"><xsl:value-of select="$title"/></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <!-- Inspiration to customize the top menu: -->
              <!--
                <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>
              </ul>-->
              <!--<ul class="nav navbar-nav navbar-right">
                <li><a href="../navbar/">Default</a></li>
                <li class="active"><a href="./">Static top <span class="sr-only">(current)</span></a></li>
                <li><a href="../navbar-fixed-top/">Fixed top</a></li>
              </ul>-->
              <form onsubmit="Verifie(ditaSearch_Form);return false" name="ditaSearch_Form"
                class="navbar-form navbar-right">
                <fieldset class="searchFieldSet">
                  <div class="input-group">
                    <input placeholder="Search..." name="textToSearch" type="text"
                      class="form-control"/>
                    <span class="input-group-btn">
                      <button onclick="Verifie(ditaSearch_Form)" type="button"
                        class="btn btn-default">Go</button>
                    </span>
                  </div>
                </fieldset>
              </form>
            </div>
            <!--/.nav-collapse -->
          </div>
        </nav>
        <div class="container-fluid">
          <iframe class="col-sm-4 col-md-3 col-lg-3" name="tocwin" src="html/tocnav.html"/>
          <iframe class="col-sm-8 col-md-9 col-lg-9" name="contentwin" src="{$firsttopicAsHtml}"/>
        </div>
        <script type="text/javascript" src="js/addition.js"></script>
        <script type="text/javascript" src="js/indexLoader.js"></script>
        <script type="text/javascript" src="js/nwSearchFnt.js"></script>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
