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

	property name="qb" inject="provider:QueryBuilder@qb";

	/*********************************** BDD SUITES ***********************************/

	function run(){
        /*
		story( "I want to be able to register users in my system and assign them a JWT token upon registration", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			});

			given( "valid registration data and the username is available", function(){
				then( "I will be able to register my new user and get an access token", function(){
					// Test user doesn't exist
					expect(
						qb.from( "users" )
							.where( "username", "testadmin" )
							.count()
					).toBe( 0 );

					var event = post( "/api/v1/registration", {
						"name"					= "Your Name",
						"email"                	= "testadmin@ortussolutions.com",
						"username"             	= "testadmin",
						"password"             	= "testadmin"
					} );
					var response = event.getPrivateValue( "response" );

					expect( response.getError() ).toBeFalse( response.getMessages().toString() );
					expect( response.getData().token ).notToBeEmpty();
					expect( response.getData().user.id ).toBeNumeric();
					expect( response.getData().user.name ).toBe( "Your Name" );

                    debug( response.getData() );
					// data = { user:struct, token:jwt token }

				});
			});

		});

	}

	story( "I want to be able to authenticate with a username/password and receive a JWT token", function(){


	} );
	
	story( "I want to be able to logout from the system using my JWT token", function(){
		
		
	} );*/
	

   }
}
