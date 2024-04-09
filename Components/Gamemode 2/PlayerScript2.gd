extends CharacterBody2D

var minSpeed = 300
var speed = 400
var acceleration = 0.01
var maxSpeed = 1200
var target = position

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		target = event.get_position()
	elif event is InputEventScreenDrag:
		target = event.get_position()

func _physics_process(delta):
	if position.distance_to(target) > 200 and speed < maxSpeed:
		speed = speed + speed * acceleration
	elif position.distance_to(target) < 200 and speed > minSpeed:
		speed = speed - speed * acceleration
	
	velocity = position.direction_to(target) * speed
	if velocity.x < 0:
		$Sprites/Face.flip_h = true
		$Sprites/Hat.flip_h = true
		$Sprites/Shirt.flip_h = true
		$Sprites/Hand.flip_h = true
		$"Sprites/Facial Hair".flip_h = true
		$Sprites/Legs.flip_h = true
	elif velocity.x > 0:
		$Sprites/Face.flip_h = false
		$Sprites/Hat.flip_h = false
		$Sprites/Shirt.flip_h = false
		$Sprites/Hand.flip_h = false
		$"Sprites/Facial Hair".flip_h = false
		$Sprites/Legs.flip_h = false
	if position.distance_to(target) > 10:
		move_and_slide()

