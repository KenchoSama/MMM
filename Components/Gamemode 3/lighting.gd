extends Area2D

var speed: int = 300
var direction = Vector2.RIGHT

func _process(delta):
	position += direction * delta * speed
