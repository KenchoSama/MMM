extends Area2D


@export var speed: int = 300
var direction = Vector2.RIGHT


func _ready():
	# Start a Timer to delete the node after 2 seconds
	$Timer.start()

func _process(delta):
	position += direction * delta * speed
	



func _on_area_2d_area_entered(area):
	queue_free()
	


func _on_area_2d_body_entered(body):
	body.hit()
	queue_free()


func _on_timer_timeout():
	queue_free()
