extends Label

var timer: Timer
func _ready():
	timer = Timer.new()
	timer.wait_time = 1
	add_child(timer)
	
func countdown():
	text = "3"
	timer.start()
	await(timer.timeout)
	text = "2"
	timer.start()
	await(timer.timeout)
	text = "1"
	timer.start()
	await(timer.timeout)
	
