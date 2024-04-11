extends Node2D

@export var amplitude: float = 1 # Amplitude of a sin wave
@export var wavelength: float = 2 * PI # Wavelength of a sin wave

@export var scalefactor: int = 50 # Used to scale up the graphed wave
# The wave is a sin wave. 
class Period extends StaticBody2D:
	# All segmentshapes should be children of the period node
	# This determines how many segments to generate per period
	var accuracy: int = 32
	var period_length: float
	
	func _init(scalefactor, initial_pos, amplitude, wavelength): # Creating a new period takes in the position to build it at
		global_position = initial_pos
		
		var lastpos = global_position
		for i in accuracy:
			var new_segment = SegmentShape2D.new()
			new_segment.a = lastpos
			
			var x_value = (wavelength / accuracy) * (i + 1)
			new_segment.b = Vector2(x_value, sin(x_value) * amplitude) * scalefactor # Scale factor here
			lastpos = new_segment.b
			period_length = new_segment.b.x # Finds final position
			
			var new_collision_shape = CollisionShape2D.new()
			new_collision_shape.shape = new_segment
			add_child(new_collision_shape)
			

# Generates first 10 waves when signalled to begin.
@export var starting_pos = Vector2.ZERO
var calculated_period_length
var current_pos: Vector2 # The current position to add a new period to
signal period_length_known # Once the period length is calculated, send the signal to the game to then tell the length to the new rigidbody
func _on_begin():
	for i in get_children(): # Frees children if there are any leftover from the last run.
		i.queue_free()
		
	var first_period: Period = Period.new(scalefactor, starting_pos, amplitude, wavelength)
	calculated_period_length = first_period.period_length # Used in infinite generation.
	add_child(first_period)
	emit_signal("period_length_known")
	
	current_pos = starting_pos
	current_pos.x = calculated_period_length
	
	for i in 9: 
		var new_period = Period.new(scalefactor, current_pos, amplitude, wavelength)
		add_child(new_period)
		current_pos.x += calculated_period_length


# Deadens waves when signalled to. TODO
func _on_lost():
	pass

# Free old period, add a new period. Signalled to run by the player as it's global position increases. 
func _shift_wave_right():
	remove_child(get_child(0))
	var new_period = Period.new(scalefactor, current_pos, amplitude, wavelength)
	add_child(new_period)
	current_pos.x += calculated_period_length
