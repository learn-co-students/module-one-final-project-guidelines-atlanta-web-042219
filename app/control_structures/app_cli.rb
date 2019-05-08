class AppCLI

	def self.run
		Login.run

		# for testing purposes
		# $user = User.find_by(username: "dev")
		# MainMenu.run
	end

	$ascii_art =%Q[                                                                                     
  ,ad8888ba,   88                                                  88               
 d8"'    `"8b  88                                                  88               
d8'            88                                                  88               
88             88   ,adPPYba,  ,adPPYYba,  8b,dPPYba,              88  8b       d8  
88             88  a8P_____88  ""     `Y8  88P'   `"8a             88  `8b     d8'  
Y8,            88  8PP"""""""  ,adPPPPP88  88       88             88   `8b   d8'   
 Y8a.    .a8P  88  "8b,   ,aa  88,    ,88  88       88     888     88    `8b,d8'    
  `"Y8888Y"'   88   `"Ybbd8"'  `"8bbdP"Y8  88       88     888     88      Y88'     
                                                                           d8'      
                                                                          d8'       ]
end
