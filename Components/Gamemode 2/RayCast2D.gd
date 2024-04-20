extends RayCast2D

var target
var tween
var tween2
var isVisible
var tweenTimer
signal loss
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	add_exception($"../../StaticBody2D")
	tween = create_tween()
	tween2 = create_tween()
	isVisible = false
	tweenTimer = $tweenTimer

func _function_shoot():
	set_physics_process(true)
	
func _fucntion_reload():
	_disappear()
	isVisible = false
	set_physics_process(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	target = $"..".laserTarget
	$Line2D.points[1] = target
	_appear()
	target_position = target
	force_raycast_update()
	
	if is_colliding() && isVisible:
		target_position = get_collision_point()
		_fucntion_reload()
		loss.emit()

func _appear() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property($Line2D, "width", 10.0, 0.1)
	tweenTimer.start(0.1)
	
func _disappear() -> void:
	tween2.kill()
	tween2 = create_tween()
	tween2.tween_property($Line2D, "width", 0, 0.1)
	tweenTimer.start(0.1)


func _on_tween_timer_timeout():
	if isVisible:
		isVisible = false
	else:
		isVisible = true
