extends Control

func _ready():
	show()

func _on_game_begin():
	hide()
	
func _on_player_lost():
	show()
