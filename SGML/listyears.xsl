<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="2.0">
  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:for-each select="/mdata/e">
<xsl:text>$years{"</xsl:text>
<xsl:value-of select="upper-case(idg/@id)"/>
<xsl:text>"} ="</xsl:text>
<xsl:value-of select="yr"/>
<xsl:text>";
</xsl:text>
    </xsl:for-each>

<xsl:text><![CDATA[
$source=$ARGV[0];
 while (<STDIN>) {
  chop;
  s/.*Texts-SGML\///;
  ($prefix, $name)= /(.*)\/(.*).sgm/;
  $y = $years{$name};
]]></xsl:text>

<xsl:text><![CDATA[
  print "<doconvert dir='$source' prefix='$prefix' year='$y' name='$name'/>\n";
}
]]>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>