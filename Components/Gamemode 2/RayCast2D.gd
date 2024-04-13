extends RayCast2D

var target
var laserTimer
var timePassed
var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	laserTimer = $LaserTimer # Replace with function body.
	timePassed = 0
	tween = create_tween()

func _function_shoot():
	laserTimer.start(2)
	_appear()
	set_physics_process(true)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	target = Vector2(500,-500)
	var cast_point = target
	force_raycast_update()
	
	if is_colliding():
		cast_point = get_collision_point()
		
	#TODO update target location correctly
	if laserTimer.is_stopped():
		_disappear()
		set_physics_process(false)

func _appear() -> void:
	tween = create_tween()
	tween.stop_all()
	tween.interpolate_property($Line2D, "width", 10.0, 0, 0.1)
	tween.start()
func _disappear() -> void:
	tween.stop_all()
	tween.interpolate_property($Line2D, "width", 10.0, 0, 0.1)
	tween.start()
