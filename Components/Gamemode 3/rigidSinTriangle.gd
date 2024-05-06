extends RigidBody2D

var sintriangle: bool = true
var initialMovementComplete = false
var initialDirection = Vector2.RIGHT
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	var direction = ($"../Player".position - position).normalized() 
	linear_velocity = direction * 150
	rotation_degrees = rad_to_deg(direction.angle())
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(linear_velocity)
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
	
