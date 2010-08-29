#!/bin/bash
XSLT_PROCESSOR=xsltproc

params="";
if [ x$2 != x ];then 
	params="-o $params";
fi;

$XSLT_PROCESSOR $params phpunit-xml2html.xslt $1 
