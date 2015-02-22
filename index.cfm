<!--- this is the redirector --->
<cfset key = cgi.QUERY_STRING>
<cfset longURI = application.URIShortener.getByKey(key)>
<cfoutput>
key: #key#<br>
key: #longURI#<br>
</cfoutput>
