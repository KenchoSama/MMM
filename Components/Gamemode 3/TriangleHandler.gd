extends Node2D
var rng = RandomNumberGenerator.new()

# References
const sintriangle:PackedScene = preload("res://Components/Gamemode 3/rigidSinTriangle.tscn")
const costriangle:PackedScene = preload("res://Components/Gamemode 3/cos_triangle.tscn")
const tantriangle:PackedScene = preload("res://Components/Gamemode 3/tantriangle.tscn")

const superSpell:PackedScene = preload("res://Components/Gamemode 3/SuperLaser.tscn")

# Variables for difficulty scaling, etc.
var triangleTimer
var triangleElims

var superSpellActive : bool = false
var waiting




func _on_pregame():
	triangleTimer = 5
	triangleElims = 0
	superSpellActive
	
func _on_begin_game():
	spawn_triangle()
	$difficultyTimer.start(10)
	
func _on_game_loss():
	# On loss, break the recursive triangle spawning.
	$SpawnTimer.stop()
	for i in $ActiveTriangles.get_children():
		i.queue_free()


# This is essentially recursive, since it will start the SpawnTimer which has its timeout signal connected to this method.
func spawn_triangle():
	var random_number = randi_range(1, 3)
	var new_triangle
	
	# Choose a type of triangle.
	if random_number == 1:
		new_triangle = sintriangle.instantiate()
	elif random_number == 2:
		new_triangle = costriangle.instantiate()
	elif random_number == 3:
		new_triangle = tantriangle.instantiate()
	
	new_triangle.player_ref = $"../Player"
	
	var positionSpawn = Vector2(-100, rng.randi_range(200, 500))
	new_triangle.position = positionSpawn
	$ActiveTriangles.add_child(new_triangle)
	
	if !superSpellActive:
		$SpawnTimer.start(triangleTimer)
		
	elif superSpellActive:
		$SpawnTimer.stop()
	

# --------------- Recent stuff from Connor, not refactored, just moved here --------------------- #

# Not sure what restart_wave is for.
func _on_restart_wave_timeout():
	waiting = false
	print("wave restarted")
	$SpawnTimer.start(triangleTimer) # Replace with function body.
	


func timerModify(val):
	triangleTimer += val


func addElim():
	triangleElims += 1
	$"../UI Layer/Control/HUD/Score".text = str(triangleElims)


func _on_difficulty_timer_timeout():
	if triangleTimer > 2:
		timerModify(-0.5) # Replace with function body.
	$difficultyTimer.start(10)


func _on_player_super_spell_activated():
	superSpellActive = true
	var newSuperSpell = superSpell.instantiate()
	$AllSpells.add_child(newSuperSpell)

func endSuper():
	superSpellActive = false
	waiting = true
	timerModify(4)
	print("restarting wave")
	$restartWave.start(3)

	
