extends Node2D

@export var speed: int = 1000
var direction = Vector2.RIGHT


func _process(delta):
	pass
	
	



func _on_area_2d_area_entered(area):
	queue_free()
	


func _on_area_2d_body_entered(body):
	body.hit()
	queue_free()
