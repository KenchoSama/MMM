extends Label

var showing = false


func _ready():
	if showing == false:
		hide()


func _process(delta):
	pass

func _on_hintsbutton_button_up():
	if showing:
		hide()
	else:
		show()
	showing = !showing
