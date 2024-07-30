extends Control

func _ready():
	hide()
	


func _on_gamemode_3_begingame():
	$Score.text = "0"
	show()
	
	


func _on_gamemode_3_game_lost():
	hide()
