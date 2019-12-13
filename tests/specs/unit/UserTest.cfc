/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="models.User"{

	/*********************************** LIFE CYCLE Methods ***********************************/
   
	function beforeAll(){
		
		super.beforeAll();
		
		// setup the model
		super.setup();
		
		// init the model object
		model.init();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){
        //prueba unitaria
		describe( "A User", function(){
			
			it( "can be created", function(){
				expect( model ).toBeComponent();
			});
	
		
		});

		given( "I have a new user", function(){
            when( "create new user", function(){
                then( "There should be one user on the view", function(){
					
				    queryExecute( "
				   
									INSERT INTO Users (id, username, email, password) 
									VALUES ('test','Jaime', 'jramirez@ortussolutions.com', '$2y$12$XzPqyJrMaSU/sZVl1gXmz.sx2bXn1IQXpNYa.tYqa5FToSZuNQssO')
								  " 
					);
					
					
					/*var qResults = qb.from( "users" )
									.insert( values = {
										"name" 		= arguments.user.getName(),
										"email" 	= arguments.user.getEmail(),
										"username" 	= arguments.user.getUsername(),
										"password" 	= bcrypt.hashPassword( arguments.user.getPassword() )
									} );

					// populate the id
					arguments.user.setId( qResults.result.generatedKey );*/

                    //var event = execute( event = "main.index", renderResults = true );

                    //var content = event.getCollection().cbox_rendered_content;

                    //expect(content).toMatch( "Test Post One" );
                   // expect(content).toMatch( "Test Post Two" );
                });
            });
    });

    }
}
