$(document).on('ready', function() {
	var authURL = 'https://accounts.spotify.com/authorize/?client_id='+oauthParams.client_id+'&response_type='+oauthParams.response_type+'&redirect_uri='+oauthParams.redirect_uri;

	$('#goToOAuth').on('click', function() {
		window.open(authURL,
								'',
								'height=600,width=600');
	});

	$('.playlist-link').on('click', function() {
		var $this = $(this);
		var playlistParams = {
			user_id: $this.data('uid'),
			playlist_id: $this.data('id')
		};

		$.get('tracks.cfm',playlistParams)
			.done(function(response) {
				$('#playlist-tracks').html(response);
			})

		$(document).on('hidden.bs.modal', '.modal', function () {
			$(this).removeData('bs.modal');
		});
	});
});