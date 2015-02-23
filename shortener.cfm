<cfscript>
param name="url.key" default="";
param name="url.uri" default="";

errors = [];
shortlink = "";
longlink = urlDecode(url.uri);

if (url.apikey != application.apiKey) {
  arrayAppend(errors, "Invalid apikey");
}
if (!isValid("url", longlink)) {
  arrayAppend(errors, "'#longlink#' is not a valid uri");
}

if (arrayLen(errors)==0) {
  shortlink = application.URIShortener.shorten(longlink);
}
</cfscript>

<cfoutput>

<cfloop array="#errors#" index="message">
#encodeForHTML(message)#<br>
</cfloop>

longlink: #longlink#<br>
shortlink: #shortlink#<br>

</cfoutput>
