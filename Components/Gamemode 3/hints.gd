extends Label

var showing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if showing == false:
		hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_hintsbutton_button_up():
	if showing:
		hide()
	else:
		show()
	showing = !showing
