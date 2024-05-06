extends Sprite2D

func _process(_delta):
	pass
	
func _ready():
	hide()


func _on_gamemode_1_game_lost(pos):
	global_position = $"../Camera".global_position + $"../Camera".offset + Vector2(0, 678)
	show()

func _on_gamemode_1_pre_game():
	hide()
	

