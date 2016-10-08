<cfscript>
	clientId = "85d4dbd1a7ae4257bb355c76bb42f819";
	clientSecret = "a2b999cae48e485ea3dd711927bb9f8c";
	redirectURI = "http://local.spotifyapp.me/callback.cfm";
	scopes = 'user-read-private user-read-email';
</cfscript>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>SpotifyTube</title>

		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

		<link rel="stylesheet" href="profilecard.css">

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		  ga('create', 'UA-1837038-24', 'auto');
		  ga('send', 'pageview');

		</script>

		<cfoutput>
			<script type="text/javascript">
				var oauthParams = {
					client_id: '#clientId#',
					response_type: 'code',
					redirect_uri: '#redirectURI#'
				};
			</script>
		</cfoutput>
	</head>
	<body>
		<cfoutput>
		<div class="container">
			<div class="page-header">
				<h1>SpotifyTube</h1>
			</div>
			<cfif structKeyExists(session,"oAuthCode")>
				<div class="row">
					<div class="col-md-4">
						<cfinclude template="profile.cfm">
					</div>
					<div class="col-md-8" id="playlist-tracks">
						<div class="text-center">
							<h3 class="text-muted"><i class="fa fa-arrow-left"></i> Load a playlist</h3>
						</div>
					</div>
				</div>
			<cfelse>
				<button class="btn btn-success" id="goToOAuth">Login</button>
			</cfif>
		</div>
		</cfoutput>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

		<script src="main.js"></script>
	</body>
</html>