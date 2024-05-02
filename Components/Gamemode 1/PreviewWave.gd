extends Node2D

const UNIT = 28 # 28 pixels between units on scaled graph

# Updated by buttons on signals.
var amp = 1
var freq = 1

# Must begin from middle since a sinusoidal should always cross origin if not translated.
var x_pos = 0
const end_x_pos = 114

func _ready():
	render()

func clear():
	for i in get_children():
		i.queue_free()
		
func render():
	clear()
	x_pos = 0
	while x_pos <= end_x_pos:
		var converted_x_pos = x_pos * (PI / UNIT)
		var point = ColorRect.new()
		point.size = Vector2(4,4)
		point.color = Color.RED
		point.position = Vector2(x_pos, amp * sin(freq * converted_x_pos) * UNIT) 
		add_child(point)
		x_pos += 1
	
	x_pos = 0
	while x_pos >= -end_x_pos:
		var converted_x_pos = x_pos * (PI / UNIT)
		var point = ColorRect.new()
		point.size = Vector2(4,4)
		point.color = Color.RED
		point.position = Vector2(x_pos, amp * sin(freq * converted_x_pos) * UNIT) 
		add_child(point)
		x_pos -= 1
	


func _on_num_change_amp(newamp):
	amp = newamp
	render()

func _on_num_change_freq(newfreq):
	freq = newfreq
	render()
