extends Control

var showing = false
func _ready():
	hide()
	
func _on_settings_button_button_down():
	if showing:
		hide()
		showing = false
	else:
		show()
		showing = true	
	

func _on_close_button_up():
	hide()
	showing = false
