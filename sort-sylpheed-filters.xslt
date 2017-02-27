<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/filter">
		<filter>
		<xsl:for-each select="rule">
			<!-- Nifty trick to ignorecase sort -->
			<xsl:sort select="translate(@name, 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" order="ascending" />
			<xsl:copy-of select="."/>
		</xsl:for-each>
		</filter>
	</xsl:template>
</xsl:stylesheet>
