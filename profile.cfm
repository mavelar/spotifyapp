<cfhttp url="https://api.spotify.com/v1/me" method="get" result="profileResult">
	<cfhttpparam name="Authorization" value="Bearer #session.oAuthCode.access_token#" type="header">
</cfhttp>

<cfset profile = deserializeJSON(profileResult.filecontent)>

<cfoutput>
	<div class="card hovercard">
    <div class="cardheader">
    </div>
    <div class="avatar">
    	<cfloop array="#profile.images#" index="i">
	    	<img alt="" src="#i.url#">
    	</cfloop>
    </div>
    <div class="info">
      <div class="title">
        <a target="_blank" href="#profile.external_urls.spotify#">#profile.display_name#</a>
      </div>
      <div class="desc">#profile.followers.total# followers</div>
    </div>
    <div class="bottom">
      <cfinclude template="playlists.cfm">
    </div>
  </div>
</cfoutput>