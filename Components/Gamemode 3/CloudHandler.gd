extends Node2D

const cloud: PackedScene = preload("res://Components/Gamemode 3/clouds.tscn")

# Called on game begin to initialize cloud creation.
func _on_begin_game():
	generate_cloud()

func _on_loss():
	# Stop the cloud timer to end the recursion.
	$cloudTimer.stop()
	clear_clouds()
	
# Function is essentially recursive. At its end, it will begin the Cloudtimer which has its timeout connected to this method
func generate_cloud():
	var new_cloud = cloud.instantiate()
	var cloudPositions = $Spawnpoints.get_children()
	var cloudPositionspawn = cloudPositions[randi() % cloudPositions.size()]
	new_cloud.position = cloudPositionspawn.global_position
	add_child(new_cloud)
	$cloudTimer.start()

func clear_clouds():
	for i in $Clouds.get_children():
		i.queue_free()
