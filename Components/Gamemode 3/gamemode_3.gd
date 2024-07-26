extends Node2D

const fireSpell: PackedScene = preload("res://Components/Gamemode 3/fire.tscn")
const lightingSpell: PackedScene = preload("res://Components/Gamemode 3/lighting.tscn")
const waterSpell: PackedScene = preload("res://Components/Gamemode 3/water.tscn")

# Main signals for switching game state .
signal pregame
signal begingame
signal gameLost

func _ready():
	emit_signal("pregame")

# Begins the game. Initializes all necessary variables for game start and signals other components to do their own beginning methods.
func _on_play_button_up():
	emit_signal("begingame")

# Restarting behaves the same. 
func _on_restart_button_up():
	emit_signal("pregame")

# Upon recieving the loss signal from the castle, signals down to all relevant nodes.
func _on_castle_lost():
	emit_signal("gameLost")



