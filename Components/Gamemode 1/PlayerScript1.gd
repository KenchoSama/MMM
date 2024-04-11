extends RigidBody2D
signal lost

func _ready():
	gravity_scale = 0.4 # Default
	
func _physics_process(_delta):
	if linear_velocity.x < 0:
		emit_signal("lost")
		
		
	if Input.is_key_label_pressed(KEY_S):
		var new_scale = gravity_scale
		new_scale += 0.2
		new_scale = clamp(new_scale, 0.4, 1.6)
		gravity_scale = new_scale
	else:
		gravity_scale = 0.4
