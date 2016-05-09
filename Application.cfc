component {
	function onRequestStart() {
		param name="url.refreshtoken" default="false";

		if(structKeyExists(session,'oAuthCode') &&
			 session.oAuthCode.expiration_time<=now() &&
			 !url.refreshtoken) {
			location url="refreshtoken.cfm?refreshtoken=true" addtoken=false;
		}
	}
}