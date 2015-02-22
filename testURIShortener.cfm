<cfset longlink = "http://www.aliaspooryorik.com/">
<cfset shortlink = application.URIShortener.shorten(longlink)>
<cfset key = listLast(shortlink, "?")>
<cfoutput>

longlink: #longlink#<br>
shortlink: #shortlink#<br>
key: #key#<br>
resolved: #application.URIShortener.getByKey(key)#

</cfoutput>
