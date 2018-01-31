@echo off

AltovaXML /xslt1 "MappingMapToTU3.xslt" /in "../xml/TU JXDM.xml" /out "TU.xml" %*
IF ERRORLEVEL 1 EXIT/B %ERRORLEVEL%
