extends Control

func _ready():
	hide()


func _on_pregame_start():
	hide()


func _on_gamemode_3_game_lost():
	print("game is over")
	show()
