<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h1>PHPUnit - Report</h1>
    <xsl:for-each select="testsuites/testsuite">
		<xsl:apply-templates/>
    </xsl:for-each>
  </body>
  </html>
</xsl:template>

<xsl:template match="testsuite">
	<h2><xsl:value-of select="name"/></h2>

</xsl:template>

</xsl:stylesheet>
