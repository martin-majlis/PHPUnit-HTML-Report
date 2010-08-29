<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
		<style>
		.suite { margin-left: 1em; clear: both;}
		.testCase, h2 { clear: both; }	
		.tcName, .tcFile, .tsTests, .tsAssertions, .tsTime { float: left;	}
		.tcAssertions, .tcTime, .tsErrors, .tsFailures { float: right;	}
		.tcName { width: 30%; }
		.tcFile { width: 35%; }
		.tcAssertions { width: 5%; }
		.tcTime { width: 10%; }
		.tsTests, .tsAssertions, .tsTime, .tsErrors, .tsFailures { width: 15%; }

		pre { clear: both; margin-left: 1em; padding-left: 1em;}	
		pre.failure { border-left: 5px solid red; }
		pre.error { border-left: 5px solid black; }

		.status { float: right; width: 5%; }
		.failureB { background-color: red; color: red; }
		.errorB { background-color: black; color: black; }
		.okB { background-color: green; color: green; }		
			
		</style>
	<body>
	<h1>PHPUnit - Report</h1>
	<xsl:for-each select="testsuites">
		<xsl:apply-templates/>
	</xsl:for-each>
	</body>
	</html>
</xsl:template>

<xsl:template match="testsuite">

<!--
	<xsl:choose>
		<xsl:when test="@failures &gt; 0">
			FAIL
			<xsl:variable name="class" select="'fail'" />
		</xsl:when>

		<xsl:when test="@errors &gt; 0">
			ERROR
			<xsl:variable name="class" select="'error'" />
		</xsl:when>

		<xsl:otherwise>
			<xsl:variable name="class" select="'ok'" />
			OK
		</xsl:otherwise>
	</xsl:choose>
//-->
	<div class="suite $class">

<!--	<xsl:value-of select="$class" /> //-->

	<h2><xsl:value-of select="@name"/></h2>

	<div class="testSuiteInfo">
		<div class="tsTests">Tests: <xsl:value-of select="@tests"/></div>
		<div class="tsAssertions">Assertions: <xsl:value-of select="@assertions"/></div>
		<div class="tsTime">Time: <xsl:value-of select="@time"/></div>
		<div class="tsErrors">Errors: <xsl:value-of select="@errors"/></div>
		<div class="tsFailures">Failures: <xsl:value-of select="@failures"/></div>
	</div>

	<xsl:for-each select=".">
		<xsl:apply-templates/>
	</xsl:for-each>
	</div>
</xsl:template>

<xsl:template match="testcase">
	<div class="testCase">
		<div class="tcName"><xsl:value-of select="@name"/></div>
		<div class="tcFile"><xsl:value-of select="substring(@file,string-length(@file)-30,31)"/></div>

		<div class="tcAssertions"><xsl:value-of select="@assertions"/></div>
		<div class="tcTime"><xsl:value-of select="@time"/></div>
		<xsl:choose>
			<xsl:when test="failure">
				<div class="status failureB">X</div>
				<pre class="failure">
					<xsl:value-of select="failure" />
				</pre>
			</xsl:when>
			<xsl:when test="error">
				<div class="status errorB">X</div>
				<pre class="error">
					<xsl:value-of select="error" />
				</pre>
			</xsl:when>
			<xsl:otherwise>
				<div class="status okB">X</div>
			</xsl:otherwise>
		</xsl:choose>

	</div>
</xsl:template>

</xsl:stylesheet>
