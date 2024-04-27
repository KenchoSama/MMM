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
	$"../UI Layer/Counter".set_text(str(int(timePassed * 100)))
	
	
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
		laserTarget = Vector2((648 + xOffset)*10, (xMulti* -(648 + xOffset)) *10)
	else:
		laserTarget = Vector2(648, 0)
	if -1*xOffset < 0:
		string = "Y=%dX-%d"
		stringActual = string % [xMulti, xOffset/54]
	elif -1*xOffset > 0:
		string = "Y=%dX+%d"
		stringActual = string % [xMulti, -1*xOffset/54]
	else:
		string = "Y=%dX"
		stringActual = string % xMulti
	$"../UI Layer/Equation".set_text(stringActual)
	reloadTimer.start(countDown)
	$"../CanvasLayer2/Border/DANGER".flash()


func _on_timer_2_timeout():
	_cannon_timer()
	position.x = 252
	if xMulti != 0:
		position.y = 324 + 324 * xMulti + xOffset
	else:
		position.y = 324 + xOffset
	$RayCast2D._function_shoot()
	if timePassed < 60:
		timer.start(countDown/2)
	else:
		timer.start(countDown/4)


func _on_ray_cast_2d_loss():
	timer.stop()
	reloadTimer.stop()
	$"../UI Layer/Equation".set_text("")
	$"../UI Layer/Counter".set_text("")
	
	
	# ------ Score + High Score logic, written neatly by Victor 
	var score = int(timePassed * 100)
	
	# Read high score from disk
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	var current_high_score = cfg.get_value("GM2Score", "score", 0) # 0 if none
	
	# If score is better, update it and save it.
	if score > current_high_score:
		current_high_score = score
		cfg.set_value("GM2Score", "score", score)
		cfg.save("user://PlayerData.cfg")
	
	# Display to user
	$"../UI Layer/Debug/DeathScreen/YourScore".set_text(str(score))
	$"../UI Layer/Debug/DeathScreen/HiScore".set_text(str(current_high_score))
	
	
	# --------------------------------------------
	
	
	set_physics_process(false)


func _on_gamemode_2_begin_game():
	timePassed = 0
	countDown = 10
	_cannon_timer()
	timer.start(countDown)
	set_physics_process(true) # Replace with function body.
