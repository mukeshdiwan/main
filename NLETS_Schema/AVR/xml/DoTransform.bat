@echo off

AltovaXML /xslt1 "MappingMapToAVR.xslt" /in "../xml/AVR JXDM.xml" /out "AVR.xml" %*
IF ERRORLEVEL 1 EXIT/B %ERRORLEVEL%
