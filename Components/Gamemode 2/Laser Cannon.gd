extends Node2D

var timer
var timerStopped
var timePassed
var countDown
var reload
var rng
var xMulti
var xOffset
var laserTarget
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	timePassed = 0
	timerStopped = true
	reload = true
	rng = RandomNumberGenerator.new()
	_cannon_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timePassed += delta
	if reload:
		xMulti = rng.randi_range(-3,3)
		xOffset = rng.randi_range(-3,3) * 54
		position.x = 252
		position.y = 324 + 324 * xMulti - xOffset
		laserTarget = Vector2(1152, (xMulti*(-1152+xOffset)))
		reload = false
	if timerStopped:
		$RayCast2D._function_shoot()
		_cannon_timer()
		timer.start(countDown)
		timerStopped = false
		reload = true
	
func _cannon_timer():
	if timePassed < 20:
		countDown = 5
	elif timePassed < 40:
		countDown = 2.5
	else:
		countDown = 1

func _on_timer_timeout():
	timerStopped = true
