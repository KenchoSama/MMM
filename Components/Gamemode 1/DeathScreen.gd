extends Control

func _ready():
	hide()
	set_process(false)

func _process(delta):
	if modulate.a < 1:
		modulate.a += 1 * delta
	else:
		modulate.a = 1
		set_process(false)
	
# Connected to it's own signal called by camera sometime after loss. 
func _on_death():
	modulate.a = 0
	show()
	set_process(true)

func _on_pregame_start():
	hide()
	set_process(false)
