<cfcontent type="text/xml; charset=utf-8">

<cfscript>
    variables.aReqs = variables.jFrapi.getRunningRequests();
    variables.requestCount = arrayLen(aReqs);
</cfscript>

<!--- <cfheader name="Expires" value="#GetHttpTimeString(Now())#"> --->

<cfoutput><?xml version="1.0" encoding="UTF-8"?></cfoutput>

<cfoutput>
<response>
	<instance cpuUsage="#variables.jFrapi.getCpuUsage()#" freeMemory="#variables.jFrapi.getFreeMemory()#" allocatedMemory="#variables.jFrapi.getAllocatedMemory()#" totalMemory="#variables.jFrapi.getTotalMemory()#" usedMemory="#variables.jFrapi.getUsedMemory()#" runningRequestCount="#variables.requestCount#" uptime="#variables.jFrapi.getUptime()#">
		<requests count="#variables.requestCount#"><cfloop from="1" to="#variables.requestCount#" index="i">
			<request runtime="#aReqs[i].getRuntime()#" clientIp="#aReqs[i].getIpAddress()#" requestId="#aReqs[i].getFusionRequestId()#" url="#xmlFormat(aReqs[i].getRequestUrl().toString())#" startTime="#aReqs[i].getStartTimeMillis()#" />
		</cfloop>
		</requests>
	</instance>
</response>
</cfoutput>
