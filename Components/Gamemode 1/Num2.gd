extends Label

# Min frequency 0.5, max 1.5.
const MIN = 0.5
const MAX = 1.5
const STEP = 0.1

var freq = 1

signal change_freq(newfreq: float)
func _ready():
	freq = 1.0
	text = str(freq)




func _on_down_button_up():
	if freq - STEP >= MIN:
		freq -= STEP
		text = str(freq)
		emit_signal("change_freq", freq)
		

	


func _on_up_button_up():
	if freq + STEP <= MAX:
		freq += STEP
		text = str(freq)
		emit_signal("change_freq", freq)
