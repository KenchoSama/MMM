extends Node2D

var timer
var timePassed
var reloadTimer
var countDown
var rng
var xMulti
var xOffset
var laserTarget
var string
var stringActual

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	reloadTimer = $Timer2
	rng = RandomNumberGenerator.new()
	set_physics_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	timePassed += delta
	$"../Label".set_text(str(int(timePassed)))
	
	
func _cannon_timer():
	if int(timePassed) % 10 == 0:
		countDown = countDown / 2
	#if timePassed < 20:
		#countDown = 5
	#elif timePassed < 40:
		#countDown = 2.5
	#else:
		#countDown = 1



func _on_timer_timeout():
	$RayCast2D._fucntion_reload()
	xMulti = rng.randi_range(-3,3)
	xOffset = rng.randi_range(-5,5) * 54
	if xMulti != 0:
		laserTarget = Vector2(648, (xMulti*-648+xOffset))
	else:
		laserTarget = Vector2(648, 0)
	if -1*xOffset < 0:
		string = "Y = %dX - %d"
		stringActual = string % [xMulti, xOffset/54]
	elif -1*xOffset > 0:
		string = "Y = %dX + %d"
		stringActual = string % [xMulti, -1*xOffset/54]
	else:
		string = "Y = %dX"
		stringActual = string % xMulti
	$"../Equation".set_text(stringActual)
	reloadTimer.start(countDown)


func _on_timer_2_timeout():
	_cannon_timer()
	position.x = 252
	if xMulti != 0:
		position.y = 324 + 324 * xMulti + xOffset
	else:
		position.y = 324 + xOffset
	$RayCast2D._function_shoot()
	if timePassed < 60:
		timer.start(0.4)
	else:
		timer.start(0.2)


func _on_ray_cast_2d_loss():
	timer.stop()
	reloadTimer.stop()
	set_physics_process(false)


func _on_gamemode_2_begin_game():
	timePassed = 0
	countDown = 10
	_cannon_timer()
	timer.start(countDown)
	set_physics_process(true) # Replace with function body.
