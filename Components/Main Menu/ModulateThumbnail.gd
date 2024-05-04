extends Button

# Done so script can be used for all 4 buttons.
func _ready():
	connect("button_down", _on_button_down)
	
func _on_button_down():
	$Thumbnail.modulate.a = 1
