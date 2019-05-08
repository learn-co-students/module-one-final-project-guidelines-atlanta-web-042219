class Global
	# declare globals
	$prompt  = TTY::Prompt.new
	$back_msg = " Type "+%Q["back"].colorize(:green)+" to return to the previous menu.\n\n"
	$press_enter = "\nPress "+"ENTER".colorize(:green)
	$return_text = "\n"+$press_enter+" to return..."
	$continue_text = $press_enter+" to continue..."
	$try_again_text = $press_enter+" to try again..."
	$user = nil
end