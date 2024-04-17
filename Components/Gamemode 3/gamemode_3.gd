extends Node2D

var fireSpell: PackedScene = preload("res://Components/Gamemode 3/fire.tscn")
var lightingSpell: PackedScene = preload("res://Components/Gamemode 3/lighting.tscn")
var waterSpell: PackedScene = preload("res://Components/Gamemode 3/water.tscn")
var triangle: PackedScene = preload("res://Components/Gamemode 3/triangles.tscn")


signal gameLost

func _ready():
	# Start the timer to spawn triangles every 5 seconds
	$Timer.start()


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



func _on_player_lost():
	emit_signal("gameLost")


func _on_restart_button_up():
	get_tree().change_scene_to_file("res://Components/Main Menu/main_menu.tscn")



func _on_timer_timeout():
	var new_triangle = triangle.instantiate()
	add_child(new_triangle)
