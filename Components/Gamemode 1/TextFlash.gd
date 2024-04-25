extends Label
var timer: Timer

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3.0
	
	set_process(false)
	hide()

func flash():
	modulate = Color.WHITE
	show()
	
	
	#TODO play noise
	
	set_process(true)
	timer.start()
	await(timer.timeout)
	
	set_process(false)
	hide()
	
	

func _process(delta):
	modulate.a = 1 - ((3.0 - timer.time_left) / 3.0)
