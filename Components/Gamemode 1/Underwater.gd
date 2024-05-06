extends Sprite2D

func _process(_delta):
	pass
	
func _ready():
	hide()
	$Ocean_Floor/CollisionShape2D.disabled = true


func _on_gamemode_1_game_lost(pos):
	global_position = $"../Camera".global_position +  $"../Camera".offset + Vector2(0, 1500)
	$Ocean_Floor/CollisionShape2D.disabled = false
	show()

func _on_gamemode_1_pre_game():
	hide()
	$Ocean_Floor/CollisionShape2D.disabled = true

