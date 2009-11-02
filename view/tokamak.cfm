<cfcontent type="text/xml; charset=utf-8">

<cfscript>
    aReqs = variables.jFrapi.getRunningRequests();
</cfscript>

<!--- <cfheader name="Expires" value="#GetHttpTimeString(Now())#"> --->

<cfoutput><?xml version="1.0" encoding="UTF-8"?></cfoutput>

<cfoutput>
<response>
	<requests count="#arrayLen(aReqs)#"><cfloop from="1" to="#arrayLen(aReqs)#" index="i">
		<request runtime="#aReqs[i].getRuntime()#" clientIp="#aReqs[i].getIpAddress()#" requestId="#aReqs[i].getFusionRequestId()#" url="#xmlFormat(aReqs[i].getRequestUrl().toString())#" startTime="#aReqs[i].getStartTimeMillis()#" />
	</cfloop>
	</requests>
</response>
</cfoutput>
