/*******************************************************************************
*	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
*
*	Extends the integration class: coldbox.system.testing.BaseTestCase
*
*	so you can test your ColdBox application headlessly. The 'appMapping' points by default to 
*	the '/root' mapping created in the test folder Application.cfc.  Please note that this 
*	Application.cfc must mimic the real one in your root, including ORM settings if needed.
*
*	The 'execute()' method is used to execute a ColdBox event, with the following arguments
*	* event : the name of the event
*	* private : if the event is private or not
*	* prePostExempt : if the event needs to be exempt of pre post interceptors
*	* eventArguments : The struct of args to pass to the event
*	* renderResults : Render back the results of the event
*******************************************************************************/
component extends="tests.resources.BaseIntegrationSpec"{

	property name="jwtService" inject="provider:JwtService@cbsecurity";
	property name="cbauth" inject="provider:authenticationService@cbauth";

	/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "Authentication Specs", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();

				// Make sure nothing is logged in to start our calls
				cbauth.logout();
				jwtService.getTokenStorage().clearAll();
			});
        
			story( "I want to authenticate a user via username/password and receive a JWT token", function(){

				given( "a valid username and password", function(){
					then( "I will be authenticated and will receive the JWT token", function(){
						// Use a user in the seeded db
						var event = post(
							route = "/api/v1/login",
							params = {
								username = "Jaime",
								password = "password"
							}
						);
						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeFalse( response.getMessages().toString() );
						expect( response.getData() ).toBeString();

						debug( response.getData() );

						var decoded = jwtService.decode( response.getData() );
						expect( decoded.sub ).toBe( 10 );
						expect( decoded.exp ).toBeGTE( dateAdd( "h", 1, decoded.iat ) );
					});
				});
                /*
				given( "invalid username and password", function(){
					then( "I will receive a 401 invalid credentials exception ", function(){
						var event = post(
							route = "/api/v1/login",
							params = {
								username = "invalid",
								password = "invalid"
							}
						);
						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeTrue();
						expect( response.getStatusCode() ).toBe( 401 );
					});
				});*/

			});
            /*
			story( "I want to be able to logout from the system using my JWT token", function(){

				given( "a valid incoming jwt token and I issue a logout", function(){
					then( "my token should become invalidated and I will be logged out", function(){

						// Log in
						var token = jwtService.attempt( "Milkshake10", "test" );
						var payload = jwtService.decode( token );
						expect( cbauth.isLoggedIn() ).toBeTrue();

						// Now Logout
						var event = post(
							route = "/api/v1/logout",
							params = {
								"x-auth-token" : token
							}
						);

						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeFalse( response.getMessages().toString() );
						expect( response.getStatusCode() ).toBe( 200 );
						expect( cbauth.isLoggedIn() ).toBeFalse();
					});
				});

				given( "an invalid incoming jwt token and I issue a logout", function(){
					then( "I should see an error message", function(){
						// Now Logout
						var event = post(
							route = "/api/v1/logout",
							params = {
								"x-auth-token" : "123"
							}
						);

						var response = event.getPrivateValue( "Response" );
						expect( response.getError() ).toBeTrue( response.getMessages().toString() );
						debug( response.getStatusCode( 500 ) );
					});
				});
			} );

		});
*/
	});
   }
}
