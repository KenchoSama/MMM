extends CharacterBody2D

signal respawn(pos)


var triangle: bool = true
#var triangle_scene: PackedScene = preload("res://Components/Gamemode 3/triangles.tscn")
var speed = 100  # Adjust the speed as needed
var direction = Vector2.RIGHT  # Initial movement direction


func _ready():
	set_process(true)  # Enable _process function


func _process(delta):
	# Move the triangle
	var movement = direction * speed * delta
	translate(movement)
	$Timer.start()
	
	

func _on_area_2d_body_entered(body):
	#print(body)
	pass


func _on_area_2d_area_entered(area):
	pass
	
	

func hit():
	print("hit")
	queue_free()



func _on_timer_timeout():
	respawn.emit()
