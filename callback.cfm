<cfset oAuthCode = #url.code#>

<cfhttp url="https://accounts.spotify.com/api/token" method="post" result="spotifyToken">
	<cfhttpparam name="Authorization" value="Basic #toBase64('85d4dbd1a7ae4257bb355c76bb42f819:a2b999cae48e485ea3dd711927bb9f8c')#" type="header">
	<cfhttpparam name="code" value="#oAuthCode#" type="formfield">
	<cfhttpparam name="redirect_uri" value="http://localhost/spotifyapp/callback.cfm" type="formfield">
	<cfhttpparam name="grant_type" value="authorization_code" type="formfield">
</cfhttp>

<cfset content = deserializeJSON(spotifyToken.filecontent)>

<cfif structKeyExists(content,"error")>
	<cfdump var="#content#">
<cfelse>
	<cfset content['expiration_time'] = dateAdd('s',content.expires_in,now())>

	<cfset session.oAuthCode = content>

	<script>
		window.opener.location.reload();
		window.close();
	</script>
</cfif>