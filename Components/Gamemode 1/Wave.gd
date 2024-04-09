extends Node2D

@export var amplitude: float = 1
@export var wavelength: float = PI

# The wave is a sin wave. 
class Period extends StaticBody2D:
	# All segmentshapes should be children of the period node
	
	# This determines how many segments to generate per period
	var accuracy: int = 32
	
	func _init(initial_pos, amplitude, wavelength): # Creating a new period takes in the position to build it at
		global_position = initial_pos
		
		var lastpos = global_position
		for i in accuracy:
			var new_segment = SegmentShape2D.new()
			new_segment.a = lastpos
			
			var x_value = (wavelength / accuracy) * (i + 1)
			new_segment.b = Vector2(x_value, sin(x_value) * amplitude) * 50 # Scale factor
			lastpos = new_segment.b
			
			var new_collision_shape = CollisionShape2D.new()
			new_collision_shape.shape = new_segment
			add_child(new_collision_shape)
		
		
	

func _ready():
	for i in 20: 
		var new_period = Period.new(Vector2(i * 2 * PI * 50, 0), 1, 2 * PI)
		add_child(new_period)
