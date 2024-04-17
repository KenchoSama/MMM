extends RayCast2D

var target
var tween
signal loss
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	add_exception($"../../StaticBody2D")
	tween = create_tween()

func _function_shoot():
	_appear()
	set_physics_process(true)
	
func _fucntion_reload():
	_disappear()
	set_physics_process(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	target = $"..".laserTarget
	target_position = target
	$Line2D.points[1] = target_position
	force_raycast_update()
	
	if is_colliding():
		target_position = get_collision_point()
		_fucntion_reload()
		loss.emit()

func _appear() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property($Line2D, "width", 10.0, 0.1)
func _disappear() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property($Line2D, "width", 0, 0.1)
