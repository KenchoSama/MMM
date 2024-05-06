extends Node2D

var fireSpell: PackedScene = preload("res://Components/Gamemode 3/fire.tscn")
var lightingSpell: PackedScene = preload("res://Components/Gamemode 3/lighting.tscn")
var waterSpell: PackedScene = preload("res://Components/Gamemode 3/water.tscn")
#var triangle: PackedScene = preload("res://Components/Gamemode 3/triangles.tscn")
var cloud:PackedScene = preload("res://Components/Gamemode 3/clouds.tscn")
var sintriangle:PackedScene = preload("res://Components/Gamemode 3/rigidSinTriangle.tscn")
var costriangle:PackedScene = preload("res://Components/Gamemode 3/cos_triangle.tscn")
var tantriangle:PackedScene = preload("res://Components/Gamemode 3/tantriangle.tscn")

var rng = RandomNumberGenerator.new()

signal begingame
signal gameLost

func _ready():
	# Start the timer to spawn triangles every 5 seconds
	#$Timer.start()
	pass


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
	get_tree().change_scene_to_file("res://Components/Gamemode 3/gamemode_3.tscn")



func _on_timer_timeout():
	if $Player:
		
		
		var random_number = rng.randi_range(1, 3)
		print(random_number)
		if random_number == 1:
			var new_sintriangle = sintriangle.instantiate()
			#var direction = ($Player.global_position - position).normalized() 
			#var player_direction = (get_global_mouse_position() - position).normalized()
			var triangle_positions = $AllTriangles.get_children()
			var positionSpawn = triangle_positions[randi() % triangle_positions.size()]
			new_sintriangle.position = positionSpawn.global_position
			#new_triangle.rotation_degrees = rad_to_deg(direction.angle())
			#new_triangle.direction = direction
			add_child(new_sintriangle)
	
		elif random_number == 2:
			var new_costriangle = costriangle.instantiate()
			#var direction = ($Player.global_position - position).normalized() 
			#var player_direction = (get_global_mouse_position() - position).normalized()
			var triangle_positions = $AllTriangles.get_children()
			var positionSpawn = triangle_positions[randi() % triangle_positions.size()]
			new_costriangle.position = positionSpawn.global_position
			#new_triangle.rotation_degrees = rad_to_deg(direction.angle())
			#new_triangle.direction = direction
			add_child(new_costriangle)
	
		elif random_number == 3:
			var new_tantriangle = tantriangle.instantiate()
			#var direction = ($Player.global_position - position).normalized() 
			#var player_direction = (get_global_mouse_position() - position).normalized()
			var triangle_positions = $AllTriangles.get_children()
			var positionSpawn = triangle_positions[randi() % triangle_positions.size()]
			new_tantriangle.position = positionSpawn.global_position
			#new_triangle.rotation_degrees = rad_to_deg(direction.angle())
			#new_triangle.direction = direction
			add_child(new_tantriangle)

		
		var new_cloud = cloud.instantiate()
		var cloudPositions = $clouds.get_children()
		var cloudPositionspawn = cloudPositions[randi() % cloudPositions.size()]
		new_cloud.position = cloudPositionspawn.global_position
		add_child(new_cloud)
	


func _on_start_button_up():
	emit_signal("begingame")


func _on_begingame():
	$Timer.start()



func _on_button_button_up():
	emit_signal("begingame")


func _on_restart_button_button_up():
	get_tree().change_scene_to_file("res://Components/Gamemode 3/gamemode_3.tscn")
