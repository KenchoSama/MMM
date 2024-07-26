extends Label

var showing = false
func _ready():
	hide()

func _on_hintsbutton_button_up():
	if showing:
		hide()
	else:
		show()
	showing = !showing
