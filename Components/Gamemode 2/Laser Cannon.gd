extends Node2D

var timer
var timerStopped
var timePassed
var countDown
var reload
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	timePassed = 0
	timerStopped = true
	reload = true
	_cannon_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timePassed += delta
	if reload:
		#TODO load first equation and start tim
		reload = false
		pass
	if timerStopped:
		
		timer.start(countDown)
		timerStopped = false

func _enemy_position():
	pass
	
func _cannon_timer():
	if timePassed < 20:
		countDown = 5
	elif timePassed < 40:
		countDown = 2.5
	else:
		countDown = 1

func _on_timer_timeout():
	timerStopped = true
