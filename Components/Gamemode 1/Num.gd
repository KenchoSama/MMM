extends Label

# Min amplitude 0.5, max 1.5.
const MIN = 0.5
const MAX = 1.5
const STEP = 0.1

var amp = 1

signal change_amp(newamp: float)
func _ready():
	amp = 1.0
	text = str(amp)




func _on_down_button_up():
	if amp - STEP >= MIN:
		amp -= STEP
		text = str(amp)
		emit_signal("change_amp", amp)
		

	


func _on_up_button_up():
	if amp + STEP <= MAX:
		amp += STEP
		text = str(amp)
		emit_signal("change_amp", amp)
