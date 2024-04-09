extends CharacterBody2D

var minSpeed = 300
var speed = 400
var acceleration = 0.01
var maxSpeed = 1200
var target = position

# used for preventing unnecessary math
var face
var hat
var shirt
var hand
var facialHair
var legs

func _ready():
	face = $Sprites/Face
	hat = $Sprites/Hat
	shirt = $Sprites/Shirt
	hand = $Sprites/Hand
	facialHair = $"Sprites/Facial Hair"
	legs = $Sprites/Legs
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
		face.flip_h = true
		hat.flip_h = true
		shirt.flip_h = true
		hand.flip_h = true
		facialHair.flip_h = true
		legs.flip_h = true
	elif velocity.x > 0:
		face.flip_h = false
		hat.flip_h = false
		shirt.flip_h = false
		hand.flip_h = false
		facialHair.flip_h = false
		legs.flip_h = false
	if position.distance_to(target) > 10:
		move_and_slide()

