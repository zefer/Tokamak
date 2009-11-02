<!---
establishes the view's variables scope
--->
<cfcomponent displayname="ViewContext">
	
	<cfset variables.jFrapi = 0 />
	<cfset variables.exception = 0 />
	
	<cffunction name="init" access="public" returntype="ViewContext" output="true">
		<cfargument name="jFrapi" required="false" hint="an instance of the FRAPI" />
		<cfargument name="exception" required="false" hint="an exception object, if an error occured" />
		
		<cfset var sOutput = '' />
		
		<cfif structKeyExists( arguments, 'exception')>
			<cfset variables.exception = arguments.exception />
			
			<cfinclude template="view/error.cfm" />
		<cfelse>
			<cfset variables.jFrapi = arguments.jFrapi />
			
			<cfinclude template="view/tokamak.cfm" />
		</cfif>
		
		<cfreturn this />
	</cffunction>
	
</cfcomponent>