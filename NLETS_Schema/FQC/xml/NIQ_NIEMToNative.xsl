<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:n2="http://www.nlets.org/niem/1.0" xmlns:nc="http://niem.gov/niem/niem-core/2.0"
  xmlns:nh2="http://www.nlets.org/niem/nlets-hdr/1.0" exclude-result-prefixes="n2 nc nh2">

  <xsl:template name="crlf">
    <xsl:text>
    </xsl:text>
  </xsl:template>


  <xsl:template name="space">
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template name="string-replace-all">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="by"/>
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$by"/>
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="by" select="$by"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/">
    <xsl:value-of select="/n2:NLETS/n2:NLETSMessageHeader/nh2:MessageKeyCodeText"
      xmlns:n2="http://www.nlets.org/niem/1.0" xmlns:nh2="http://www.nlets.org/niem/nlets-hdr/1.0"
    />.<xsl:value-of select="/n2:NLETS/n2:NLETSMessageHeader/nh2:OriginatingORIID"
      xmlns:n2="http://www.nlets.org/niem/1.0" xmlns:nh2="http://www.nlets.org/niem/nlets-hdr/1.0"
      />.<xsl:variable name="recTm" select="/n2:NLETS/n2:NLETSMessageHeader/nh2:MessageReceiveTime"/>
    <xsl:variable name="recDt" select="/n2:NLETS/n2:NLETSMessageHeader/nh2:MessageReceiveDate"/>
    <xsl:variable name="sndNum" select="/n2:NLETS/n2:NLETSMessageHeader/nh2:SendMessageNumeric"/>
    <xsl:variable name="sndTm" select="/n2:NLETS/n2:NLETSMessageHeader/nh2:MessageSendTime"/>
    <xsl:variable name="sndDt" select="/n2:NLETS/n2:NLETSMessageHeader/nh2:MessageSendDate"/>
    <xsl:variable name="recNum" select="/n2:NLETS/n2:NLETSMessageHeader/nh2:ReceiveMessageNumeric"/>
    <xsl:if test="$recTm!=''">
      <xsl:call-template name="crlf"/><xsl:value-of select="$recTm"/><xsl:call-template name="space"
        /><xsl:value-of select="$recDt"/><xsl:call-template name="space"/><xsl:value-of
        select="$sndNum"/><xsl:call-template name="crlf"/>
      <xsl:value-of select="$sndTm"/><xsl:call-template name="space"/><xsl:value-of select="$sndDt"
        /><xsl:call-template name="space"/><xsl:value-of select="$recNum"/><xsl:call-template
        name="crlf"/>
    </xsl:if>
    <xsl:value-of select="/n2:NLETS/n2:NLETSMessageHeader/nh2:DestinationORIID"
      xmlns:n2="http://www.nlets.org/niem/1.0" xmlns:nh2="http://www.nlets.org/niem/nlets-hdr/1.0"
    />.<xsl:variable name="ctrl"
      select="/n2:NLETS/n2:NLETSMessageHeader/nh2:DocumentControlFieldText"/>
    <xsl:if test="$ctrl!=''">*<xsl:value-of select="$ctrl"/>.</xsl:if>TXT
VIN/<xsl:value-of select="/n2:NLETS/n2:NLETSInquiryData/nc:Vehicle/nc:VehicleIdentification/nc:IdentificationID" xmlns:n2="http://www.nlets.org/niem/1.0" xmlns:nc="http://niem.gov/niem/niem-core/2.0"/>
    </xsl:template>
    
</xsl:stylesheet>