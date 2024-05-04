extends Button

# Reference to player object assigned at game start.
var player_ref

func _on_button_down():
	if player_ref != null:
		player_ref.down = true

func _on_button_up():
	if player_ref != null:
		player_ref.down = false
