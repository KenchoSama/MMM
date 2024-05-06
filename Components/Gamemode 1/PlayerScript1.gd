extends RigidBody2D

@export var base_gravity: float

var waves_traversed: int = 0
var calculated_period_length: float = 0
signal lost
signal shift_waves

#Gravity increased or not
var down: bool = false
var alive: bool = true

func _ready():
	gravity_scale = base_gravity
	$WaterParticles.emitting = false

func _physics_process(_delta):
	if position.y > 700:
		emit_signal("lost")
		set_physics_process(false)
		$WaterParticles.emitting = false
		alive = false
		return
	
	if calculated_period_length != 0: # Has been set by wave node.
		if global_position.x / calculated_period_length > waves_traversed:
			waves_traversed += 1
			if waves_traversed > 6:
				emit_signal("shift_waves")
	
	#print(linear_velocity)
	if linear_velocity.x < 0:
		emit_signal("lost")
		set_physics_process(false)
		alive = false
		$WaterParticles.emitting = false
		return
	
	# Mobile input || PC input
	if down || Input.is_key_label_pressed(KEY_S): # TODO work w/ touchscreen
		var new_scale = gravity_scale
		new_scale += 0.2
		new_scale = clamp(new_scale, base_gravity, 2.4)
		gravity_scale = new_scale
	else:
		gravity_scale = base_gravity

const MAXSPEED = 3000
func _integrate_forces(state):
	
	var x_vel = clamp(linear_velocity.x, -MAXSPEED, MAXSPEED)
	var y_vel = clamp(linear_velocity.y, -MAXSPEED, MAXSPEED)
	
	
	linear_velocity = Vector2(x_vel, y_vel)
	


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play(1.4) # Replace with function body.


func _on_body_entered(body):
	if global_position.x > 800: #Past ramp
		if alive:
			$WaterParticles.emitting = true
	
func _on_body_exited(body):
	if alive:
		$WaterParticles.emitting = false


func _on_jump():
	$JumpParticles.emitting = true
