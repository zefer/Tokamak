<cfheader statuscode="500" statustext="Error processing request" />
<cfcontent type="text/xml; charset=utf-8" />

<!--- <cfdump var="#exception#"><cfabort> --->
<cfoutput><?xml version="1.0" encoding="UTF-8"?></cfoutput>

<cfoutput>
<response>
	<error type="#xmlFormat(exception.type)#" message="#xmlFormat(exception.message)#" />
</response>
</cfoutput>