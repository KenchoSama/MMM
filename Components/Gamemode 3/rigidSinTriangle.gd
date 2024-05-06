extends RigidBody2D

var sintriangle: bool = true
var initialMovementComplete = false
var initialDirection = Vector2.RIGHT
var direction
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	var direction = ($"../Player".position - position).normalized() 
	linear_velocity = direction * 200
	rotation_degrees = rad_to_deg(direction.angle())
	$Timer.start()
	$Sprite2D2.visible = false
	$Sprite2D.visible = false
	$Sprite2D3.visible = false
	var random_number = rng.randi_range(1, 3)
	if random_number == 1:
		$Sprite2D2.visible = true
	
	elif random_number == 2:
		$Sprite2D.visible = true
	
	elif random_number == 3:
		$Sprite2D3.visible = true
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(linear_velocity)
	#linear_velocity = direction * delta * 3000
	#if position.distance_to($"../Player".position) > 500:
	#	initialMovementComplete = true
	#else:
#		# If initial movement is complete, continue moving in the last direction
	#	linear_velocity = initialDirection * delta * 3000
	pass

func hit():
	print("hit")
	queue_free()



func _on_timer_timeout():
	linear_velocity = linear_velocity * 1.1
	
