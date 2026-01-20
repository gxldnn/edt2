<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <table>
                    <tr class="head">
                        <td><b>Pokemon Sí Legendary</b></td>
                    </tr>

                    <xsl:for-each select="pokedex/pokemon[legendary='1.0']">
                        <tr>
                        <xsl:template name="mostrarPokemon">
                        <xsl:param name="pokemon"/>
                            <xsl:choose>
                                <xsl:when test="type1='Fire'">
                                    <td class="Fire"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Water'">
                                    <td class="Water"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Dark'">
                                    <td class="Dark"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Normal'">
                                    <td class="Normal"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Fighting'">
                                    <td class="Fighting"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td><xsl:value-of select="name"/></td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:template>
                        </tr>
                    </xsl:for-each>
                </table>
                <br/>
                <table>
                    <tr class="head">
                        <td><b>Pokemon No Legendary</b></td>
                    </tr>
                    <xsl:for-each select="pokedex/pokemon[legendary='0.0']">
                        <tr>
                            <xsl:choose>
                                <xsl:when test="type1='Fire'">
                                    <td class="Fire"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Water'">
                                    <td class="Water"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Dark'">
                                    <td class="Dark"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Normal'">
                                    <td class="Normal"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:when test="type1='Fighting'">
                                    <td class="Fightºing"><xsl:value-of select="name"/></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td><xsl:value-of select="name"/></td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
