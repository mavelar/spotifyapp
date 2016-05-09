<cfhttp url="https://api.spotify.com/v1/users/#user_id#/playlists/#playlist_id#/tracks" method="get" result="tracksResult">
	<cfhttpparam name="Authorization" value="Bearer #session.oAuthCode.access_token#" type="header">
</cfhttp>

<cfset tracks = deserializeJSON(tracksResult.filecontent)>

<cfoutput>
	<cfloop array="#tracks.items#" index="t">
		<cfset artists = []>
		<cfloop array="#t.track.artists#" index="an">
			<cfset  arrayAppend(artists,an.name)>
		</cfloop>
		<cfset artists = arrayToList(artists)>

		<div class="media">
			<div class="media-left">
				<cfloop array="#t.track.album.images#" index="tai">
					<cfif tai.width EQ 64>
						<a href="youtube.cfm?q=#URLEncodedFormat(artists&' '&t.track.name)#" data-toggle="modal" data-target="##videoModal">
			    		<img class="media-object" src="#tai.url#">
			    	</a>
			    </cfif>
		    </cfloop>
		  </div>
		  <div class="media-body">
		    <h4 class="media-heading">#t.track.name#</h4>
		    <ul class="list-unstyled">
		    	<li>Artist: <cfloop array="#t.track.artists#" index="an"><span class="label label-default">#an.name#</span> </cfloop></li>
		    	<li>Album: <span class="label label-default">#t.track.album.name#</span></li>
		    </ul>
		  </div>
		</div>
	</cfloop>
</cfoutput>

<div class="modal fade" id="videoModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    </div>
  </div>
</div>