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
      <div class="alert alert-success">Session Started - <a href="signout.cfm" class="alert-link">Sign Out</a></div>
    </div>
    <div class="bottom">
      <cfinclude template="playlists.cfm">
    </div>
    <div class="text-center">
      <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a>
    </div>
  </div>
</cfoutput>