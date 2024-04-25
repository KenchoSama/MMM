extends Sprite2D

var rng
var scaleToBe
var ship
var frames

const ship1 = [
	Rect2 (0,0,32,32),
	Rect2 (32,0,32,32),
	Rect2 (64,0,32,32)
]

const ship2 = [
	Rect2 (0,32,32,32),
	Rect2 (32,32,32,32),
	Rect2 (64,32,32,32)
]

const ship3 = [
	Rect2 (0,64,32,32),
	Rect2 (32,64,32,32),
	Rect2 (64,64,32,32)
]

const ship4 = [
	Rect2 (0,96,32,32),
	Rect2 (32,96,32,32),
	Rect2 (64,96,32,32)
]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	rng = RandomNumberGenerator.new() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	texture.region = frames.pick_random()


func _on_spaceship_change_size():
	ship = rng.randi_range(0,3)
	if ship == 0:
		frames = ship1
	elif ship == 1:
		frames = ship2
	elif ship == 2:
		frames = ship3
	else:
		frames = ship4
	scaleToBe = rng.randf_range(0.5,1)
	scale.x = scaleToBe
	scale.y = scaleToBe


func _on_gamemode_2_begin_game():
	set_process(true) # Replace with function body.


func _on_ray_cast_2d_loss():
	set_process(false) # Replace with function body.
