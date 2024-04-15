extends Control

func _ready():
	_pregame_selection()

func _pregame_selection():
	show()
	
func _on_game_begin():
	hide()
