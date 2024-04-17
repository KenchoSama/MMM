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
	var direction = ($Player.global_position - position).normalized() 
	#var player_direction = (get_global_mouse_position() - position).normalized()
	var triangle_positions = $AllTriangles.get_children()
	var positionSpawn = triangle_positions[randi() % triangle_positions.size()]
	new_triangle.position = positionSpawn.global_position
	new_triangle.rotation_degrees = rad_to_deg(direction.angle())
	new_triangle.direction = direction
	add_child(new_triangle)
	
