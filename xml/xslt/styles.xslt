<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <!-- variables -->
    <xsl:variable name="border-width">1pt</xsl:variable>
    <xsl:variable name="border-style">solid</xsl:variable>
    <xsl:variable name="border-color">black</xsl:variable>
    <xsl:variable name="tabbed-numbering-tabwidth">20mm</xsl:variable>
    <xsl:variable name="small-space">5pt</xsl:variable>
    <xsl:variable name="large-space">8mm</xsl:variable>
    <xsl:variable name="very-large-space">1.5cm</xsl:variable>
    
    <!-- User-accessible classes -->
    <xsl:attribute-set name="keep-together">
        <xsl:attribute name="keep-together">always</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Text -->
    <xsl:attribute-set name="DefaultFont">
        <xsl:attribute name="font-family">LiberationSansNarrow</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="HeaderFont" use-attribute-sets="DefaultFont"/>
    <xsl:attribute-set name="FooterFont" use-attribute-sets="DefaultFont"/>
    <xsl:attribute-set name="TableFont" use-attribute-sets="DefaultFont">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="TinyFont" use-attribute-sets="DefaultFont">
        <xsl:attribute name="font-size">8pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="CodeFont" use-attribute-sets="DefaultFont">
        <xsl:attribute name="font-family">LiberationMono</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
    </xsl:attribute-set><!--
    <xsl:attribute-set name="title">
        <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>-->
    <xsl:attribute-set name="title-0" use-attribute-sets="title">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">1cm</xsl:attribute>
        <xsl:attribute name="background-color">orange</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-1" use-attribute-sets="title">
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">1cm</xsl:attribute>
        <xsl:attribute name="background-color">orange</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-2" use-attribute-sets="title">
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">0.8cm</xsl:attribute>
        <xsl:attribute name="background-color">silver</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-3" use-attribute-sets="title">
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">0.8cm</xsl:attribute>
        <xsl:attribute name="background-color">silver</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-4" use-attribute-sets="title">
        <xsl:attribute name="margin-bottom">5pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-client" use-attribute-sets="title-0">
        <xsl:attribute name="background-color">silver</xsl:attribute>
        <xsl:attribute name="margin-bottom">6cm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="for">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="margin-bottom">1cm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-toc" use-attribute-sets="title-1">
        <xsl:attribute name="margin-bottom">0cm</xsl:attribute>
        <xsl:attribute name="padding-right">3pt</xsl:attribute>
        <!-- this is cheating, need to check if toc page numbers can be rendered in a better way -->
    </xsl:attribute-set>
    <xsl:attribute-set name="section">
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$very-large-space"/>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="bold">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="italic">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="underline">
        <xsl:attribute name="text-decoration">underline</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="monospace" use-attribute-sets="DefaultFont">
        <xsl:attribute name="font-family">LiberationMono</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="background-color">#eeeeee</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="p">
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$small-space"/>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="list" use-attribute-sets="p"/>
    <xsl:attribute-set name="last">
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$very-large-space"/>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="pre" use-attribute-sets="borders TableFont">
        <xsl:attribute name="border-style">double</xsl:attribute>
        <xsl:attribute name="border-width">2pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$medium-space"/>
        </xsl:attribute>
        <xsl:attribute name="white-space-collapse">false</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="code" use-attribute-sets="borders pre">
        <xsl:attribute name="font-family">LiberationMono</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="finding-meta">
        <xsl:attribute name="margin-bottom" select="$small-space"/>
    </xsl:attribute-set>
    
    <!-- Pages -->
    <xsl:attribute-set name="PortraitPage">
        <xsl:attribute name="margin-top">2cm</xsl:attribute>
        <xsl:attribute name="margin-bottom">1.8cm</xsl:attribute>
        <xsl:attribute name="margin-left">2cm</xsl:attribute>
        <xsl:attribute name="margin-right">2cm</xsl:attribute>
        <xsl:attribute name="page-height">29.7cm</xsl:attribute>
        <xsl:attribute name="page-width">21.0cm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="region-body">
        <xsl:attribute name="margin-top">1cm</xsl:attribute>
        <xsl:attribute name="margin-bottom">1cm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="region-before">
        <xsl:attribute name="precedence">true</xsl:attribute>
        <xsl:attribute name="extent">0.6cm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="region-after">
        <xsl:attribute name="precedence">true</xsl:attribute>
        <xsl:attribute name="extent">0.6cm</xsl:attribute>
        <xsl:attribute name="padding">0</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="footer">
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- colors -->
    <xsl:attribute-set name="bg-orange">
        <xsl:attribute name="background-color">orange</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- graphics -->
    <xsl:attribute-set name="graphics-block">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="margin-bottom" select="$small-space"/>
    </xsl:attribute-set>
    <xsl:attribute-set name="logo">
        <xsl:attribute name="padding-top">2cm</xsl:attribute>
        <xsl:attribute name="padding-bottom">3cm</xsl:attribute>
        <xsl:attribute name="src">url(../graphics/logo.png)</xsl:attribute>
        <xsl:attribute name="width">70mm</xsl:attribute>
        <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
        <xsl:attribute name="content-height">scale-to-fit</xsl:attribute>
        <xsl:attribute name="scaling">uniform</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- tables -->
    <xsl:attribute-set name="borders">
        <xsl:attribute name="border-width">
            <xsl:value-of select="$border-width"/>
        </xsl:attribute>
        <xsl:attribute name="border-style">
            <xsl:value-of select="$border-style"/>
        </xsl:attribute>
        <xsl:attribute name="border-color">
            <xsl:value-of select="$border-color"/>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="th" use-attribute-sets="td bg-orange"/>
    <xsl:attribute-set name="td">
        <xsl:attribute name="padding">2pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="table">
        <xsl:attribute name="margin-bottom" select="$small-space"/>
    </xsl:attribute-set>
    
    <!-- lists -->
    <xsl:attribute-set name="li">
        <xsl:attribute name="margin-bottom" select="$small-space"/>
    </xsl:attribute-set>
    
    <!-- ToC -->
    <xsl:attribute-set name="index">
        <xsl:attribute name="break-after">page</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="toc-block" use-attribute-sets="bg-orange">
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
        <xsl:attribute name="padding-right">3pt</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Contact -->
    <xsl:attribute-set name="Contact">
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
        <xsl:attribute name="margin-left" select="$very-large-space"/>
        <xsl:attribute name="line-height">18pt</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Signature boxes -->
    <xsl:attribute-set name="signaturebox">
        <xsl:attribute name="margin-top" select="$very-large-space"/>
    </xsl:attribute-set>
</xsl:stylesheet>