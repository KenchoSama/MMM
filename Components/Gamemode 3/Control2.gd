extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	show()

func _on_pregame():
	show()
	
func _on_begin_game():
	hide()
