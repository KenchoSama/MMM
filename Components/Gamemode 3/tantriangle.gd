extends RigidBody2D

var tantriangle: bool = true
var initialMovementComplete = false
var initialDirection = Vector2.RIGHT
var direction
var rng = RandomNumberGenerator.new()

# Assigned at moment of instancing.
var player_ref 
# Called when the node enters the scene tree for the first time.
func _ready():
	var direction = (player_ref.position - position).normalized() 
	linear_velocity = direction * 200
	rotation_degrees = rad_to_deg(direction.angle())
	$Timer.start()
	$Sprite2D2.visible = false
	$Sprite2D.visible = false
	$Sprite2D3.visible = false
	$Sprite2D4.visible = false
	var random_number = rng.randi_range(1, 4)
	if random_number == 1:
		$Sprite2D2.visible = true
	
	elif random_number == 2:
		$Sprite2D.visible = true
	
	elif random_number == 3:
		$Sprite2D3.visible = true
		
	elif random_number == 4:
		$Sprite2D4.visible = true
	
	
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
	# Eventually put an animation here before queue free.

	queue_free()



func _on_timer_timeout():
	linear_velocity = linear_velocity * 1.1
	
