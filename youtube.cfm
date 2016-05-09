
<cfhttp url="https://www.googleapis.com/youtube/v3/search" method="get" result="youtubeResult">
	<cfhttpparam name="part" value="id" type="url">
	<cfhttpparam name="q" value="#url.q#" type="url">
	<cfhttpparam name="type" value="video" type="url">
	<cfhttpparam name="maxResults" value="1" type="url">
	<cfhttpparam name="videoEmbeddable" value="true" type="url">
	<cfhttpparam name="key" value="AIzaSyATBNHvj7f075yyp__m2qppOS-Fn2FhAnQ" type="url">
</cfhttp>

<cfset result = deserializeJSON(youtubeResult.filecontent)>

<cfoutput>
	<div class="modal-header">
	  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  <h4 class="modal-title" id="myModalLabel">Video Found in youtube</h4>
	</div>
	<div class="modal-body">
	  <div class="embed-responsive embed-responsive-16by9">
	  	<cfloop array="#result.items#" index="v">
		  	<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/#v.id.videoId#"></iframe>
		  </cfloop>
		</div>
	</div>
	<div class="modal-footer">
	  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</cfoutput>