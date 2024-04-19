extends Node2D

@export var amplitude: float = 1 # Amplitude of a sin wave
@export var frequency: float = 1 # Frequency of a sin wave (wavelength = 2PI)

@export var scalefactor: int = 100 # Used to scale up the graphed wave
# The wave is a sin wave. 
class Period extends StaticBody2D:
	# All segmentshapes should be children of the period node
	# This determines how many segments to generate per period
	
	var accuracy: int = 64
	var period_length: float
	func _init(scalefactor, initial_pos, amplitude, frequency): # Creating a new period takes in the position to build it at
		
		global_position = initial_pos
		
		var lastpos = global_position
		for i in accuracy:
			var new_segment = SegmentShape2D.new()
			new_segment.a = lastpos
			
			var x_value = ((1 / frequency * 2 * PI) / accuracy) * (i + 1)
			new_segment.b = Vector2(x_value, amplitude * sin(frequency * x_value)) * scalefactor # follows sinusoidal equation. Scalefactor to make the wave bigger.
			lastpos = new_segment.b
			period_length = new_segment.b.x # Finds final position
			
			# Water lines
			var enabled = true # for debug
			if enabled:
				var water_rect = ColorRect.new()
				water_rect.color = Color.LIGHT_SEA_GREEN
				water_rect.position = lastpos - Vector2(2, 0)
				water_rect.size = Vector2(2 + new_segment.b.x - new_segment.a.x, 1000)
				add_child(water_rect)
				
				var surface_water_rect = ColorRect.new()
				surface_water_rect.color = Color.TEAL
				surface_water_rect.position = lastpos - Vector2(2, 0)
				surface_water_rect.size = Vector2(2 + new_segment.b.x - new_segment.a.x, 5)
				add_child(surface_water_rect)
			
			var new_collision_shape = CollisionShape2D.new()
			new_collision_shape.shape = new_segment
			new_collision_shape.one_way_collision = true
			new_collision_shape.one_way_collision_margin = 10
			add_child(new_collision_shape)
		
		queue_redraw()


# Generates first 10 waves when signalled to begin.
@export var starting_pos = Vector2.ZERO
var calculated_period_length
var current_pos: Vector2 # The current position to add a new period to
signal period_length_known # Once the period length is calculated, send the signal to the game to then tell the length to the new rigidbody
func _on_begin():
	for i in get_children(): # Frees children if there are any leftover from the last run.
		i.queue_free()
		
	var first_period: Period = Period.new(scalefactor, starting_pos, amplitude, frequency)
	calculated_period_length = first_period.period_length # Used in infinite generation.
	add_child(first_period)
	emit_signal("period_length_known")
	
	current_pos = starting_pos
	current_pos.x = calculated_period_length
	
	for i in 9: 
		var new_period = Period.new(scalefactor, current_pos, amplitude, frequency)
		add_child(new_period)
		current_pos.x += calculated_period_length


# TODO Deadens waves when signalled to. 
func _on_lost():
	print("lost, flatten waves")
	pass

# Free old period, add a new period. Signalled to run by the player as it's global position increases. 
func _shift_wave_right():
	remove_child(get_child(0))
	var new_period = Period.new(scalefactor, current_pos, amplitude, frequency)
	add_child(new_period)
	current_pos.x += calculated_period_length


# ---------- Changes to amplitude / frequency ----------- 
func _amplitude_changed(newamp: float):
	amplitude = newamp
	
func _frequency_changed(newfrequency: float):
	frequency = newfrequency

