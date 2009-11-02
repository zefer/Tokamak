<cfcomponent output="false">
	
	<cfset this.name = 'tokamak' />
	<cfset this.sessionManagement = false />
	<cfset this.clientManagement = false />
	<cfset this.setClientCookies = false />
	<cfset this.setDomainCookies = false />
	<cfset variables.bInitialised = false />

	<cffunction name="onApplicationStart" access="public" returntype="boolean" output="false">
		<cfreturn true />
	</cffunction>
	
	<cffunction name="init" access="public" returntype="void" output="false">
		
		<!--- create an instance of the Fusion Reactor API - FRAPI --->
		<cflock name="tokamak_init" timeout="5" type="exclusive">
			<cfset application.jFrapi = createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance() />
		</cflock>
		
		<cfset variables.bInitialised = true />
		
	</cffunction>
	
	<cffunction name="onRequestStart" returnType="void" output="false">
		<!--- surpress white space and debugging, to prevent it from invalidating XML --->
		<cfsetting enablecfoutputonly="true" />
		<cfsetting showdebugoutput="false">
	</cffunction>
	
	<cffunction name="onRequest" returnType="void">
		<cfargument name="template" type="string" required="true">
		
		<cftry>
			<!--- init the app if required --->
			<cfif (StructKeyExists(url, 'reload') and ListFindNoCase('yes,1,true,reload',url.reload)) or not variables.bInitialised>
				<cfset this.init() />
			</cfif>
			
			<!--- do the output --->
			<cfset variables.viewContext = createObject('component', 'ViewContext').init( jFrapi:application.jFrapi ) />
			
			<cfcatch type="any">
				<!--- output the error --->
				<cfset variables.viewContext = createObject('component', 'ViewContext').init( exception:cfcatch ) />
			</cfcatch>
		</cftry>
		
		<cfreturn />
		
	</cffunction>
	
</cfcomponent>