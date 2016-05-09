<cfhttp url="https://api.spotify.com/v1/me/playlists" method="get" result="playlistsResult">
	<cfhttpparam name="Authorization" value="Bearer #session.oAuthCode.access_token#" type="header">
</cfhttp>

<cfset playlists = deserializeJSON(playlistsResult.filecontent)>

<cfoutput>
	<div class="list-group">
		<cfloop array="#playlists.items#" index="p">
	  	<button type="button" class="list-group-item playlist-link" data-id="#p.id#" data-uid="#p.owner.id#">
	  		<span class="badge">#p.tracks.total#</span>
	  		#p.name#
	  	</button>
	  </cfloop>
	</div>
</cfoutput>