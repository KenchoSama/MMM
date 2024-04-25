extends CharacterBody2D


# Get the gravity from the project settings to be synced with RigidBody nodes
var target
var speed
var rng

signal changeSize

func _ready():
	rng = RandomNumberGenerator.new()
	target = position
	set_physics_process(false)

func _physics_process(delta):
	if position.distance_to(target) < 5:
		changeSize.emit()
		speed = rng.randi_range(150,500)
		position.x = rng.randi_range(0,1152)
		if position.x < 900 && position.x > 252:
			if rng.randi_range(0,1):
				position.y = -10
			else:
				position.y = 658
		else:
			position.y = rng.randi_range(0,648)
		
		if position.x < 648:
			target.x = rng.randi_range(900, 1152)
		else:
			target.x = rng.randi_range(0,252)
		
		if position.y < 324:
			target.y = rng.randi_range(324, 658)
		else:
			target.y = rng.randi_range(0,324)
		
		velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 0:
		look_at(target)
		move_and_slide()


func _on_ray_cast_2d_loss():
	set_physics_process(false) # Replace with function body.


func _on_gamemode_2_begin_game():
	set_physics_process(true) # Replace with function body.
