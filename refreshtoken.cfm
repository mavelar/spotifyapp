<cfhttp url="https://accounts.spotify.com/api/token" method="post" result="spotifyToken">
	<cfhttpparam name="Authorization" value="Basic #toBase64('85d4dbd1a7ae4257bb355c76bb42f819:a2b999cae48e485ea3dd711927bb9f8c')#" type="header">
	<cfhttpparam name="refresh_token" value="#session.oauthcode.refresh_token#" type="formfield">
	<cfhttpparam name="grant_type" value="refresh_token" type="formfield">
</cfhttp>

<cfset content = deserializeJSON(spotifyToken.filecontent)>

<cfif structKeyExists(content,"error")>
	<cfdump var="#content#">
<cfelse>
	<cfset content['expiration_time'] = dateAdd('s',content.expires_in,now())>

	<cfset session.oAuthCode.access_token = content.access_token>
	<cfset session.oAuthCode.expiration_time = content.expiration_time>

	<cflocation url="./" addtoken="false">
</cfif>