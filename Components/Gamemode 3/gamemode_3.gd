extends Node2D

var fireSpell: PackedScene = preload("res://Components/Gamemode 3/fire.tscn")
var lightingSpell: PackedScene = preload("res://Components/Gamemode 3/lighting.tscn")
var waterSpell: PackedScene = preload("res://Components/Gamemode 3/water.tscn")

# Main signals for switching game state .
signal pregame
signal begingame
signal gameLost

func _ready():
	emit_signal("pregame")

func _on_player_firespell_activated(pos, direction):
	#print("spell activated from the gamemode script")
	var spell1 = fireSpell.instantiate()
	spell1.position = pos
	spell1.rotation_degrees = rad_to_deg(direction.angle()) + 90
	spell1.direction = direction
	$AllSpells.add_child(spell1)



func _on_player_lightingspell_activated(pos, direction):
	#print("spell activated from the gamemode script")
	var spell2 = lightingSpell.instantiate()
	spell2.position = pos
	spell2.rotation_degrees = rad_to_deg(direction.angle())
	spell2.direction = direction
	$AllSpells.add_child(spell2)
	

func _on_player_waterspell_activated(pos, direction):
	#print("spell activated from the gamemode script")
	var spell2 = waterSpell.instantiate()
	spell2.position = pos
	spell2.rotation_degrees = rad_to_deg(direction.angle())
	spell2.direction = direction
	$AllSpells.add_child(spell2)
	


# Begins the game. Initializes all necessary variables for game start and signals other components to do their own beginning methods.
func _on_play_button_up():
	emit_signal("begingame")

# Restarting behaves the same. 
func _on_restart_button_up():
	emit_signal("pregame")
	

# Upon recieving the loss signal from the castle, signals down to all relevant nodes.
func _on_castle_lost():
	emit_signal("gameLost")



