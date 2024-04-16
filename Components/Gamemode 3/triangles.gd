extends Node2D

var triangle: bool = true

var triangle_scene: PackedScene = preload("res://Components/Gamemode 3/triangles.tscn")
var move_speed = 100  # Adjust the speed as needed
var direction = Vector2.RIGHT  # Initial movement direction

func _ready():
	set_process(true)  # Enable _process function
	$Timer.start()

func _process(delta):
	# Move the triangle
	pass
	var movement = direction * move_speed * delta
	translate(movement)


func _on_area_2d_body_entered(body):
	print(body)
	


func _on_area_2d_area_entered(area):
	pass
	
	
func hit():
	print("hit")
	queue_free()
	


