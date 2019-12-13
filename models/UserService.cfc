/**
* I am a new Model Object
*/
component singleton accessors="true"{

	// Properties
	property name="bcrypt"      inject="@BCrypt";
	property name="qb"          inject="provider:QueryBuilder@qb";

	/**
	 * Constructor
	 */
	UserService function init(){
		return this;
	}

	User function new() provider="User";

	/**
	* create
	*/
	function create( required user ){
		var qResults = qb.from( "users" )
			.insert( values = {
				"name" 		= arguments.user.getName(),
				"email" 	= arguments.user.getEmail(),
				"username" 	= arguments.user.getUsername(),
				"password" 	= bcrypt.hashPassword( arguments.user.getPassword() )
			} );

		// populate the id
		arguments.user.setId( qResults.result.generatedKey );

		return arguments.user;
	}

}
