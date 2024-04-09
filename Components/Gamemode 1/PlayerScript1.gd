extends RigidBody2D
# Write code for the player in gamemode 1 here

func _ready():
	gravity_scale = 0.2 # Default
	
func _physics_process(_delta):
	if Input.is_key_label_pressed(KEY_S):
		var new_scale = gravity_scale
		new_scale += 0.05
		clamp(new_scale, 0.2, 1)
		gravity_scale = new_scale
	else:
		gravity_scale = 0.2
		
