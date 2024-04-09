extends RayCast2D

var target
var timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var cast_point = target
	force_raycast_update
	
	if is_colliding():
		cast_point = to_local(get_colission_point())
		
	#TODO update target location correctly

func _function_shoot():
	#TODO casting ray based on time intervals
