extends Node2D

@export var speed: int = 300
var direction = Vector2.RIGHT


func _ready():
	# Start a Timer to delete the node after 2 seconds
	$Timer.start()
	$lightingExplosion.visible = false

func _process(delta):
	position += direction * delta * speed
	

#func _on_area_2d_area_entered(area):
	#queue_free()
	#print("explode")
	


func _on_area_2d_body_entered(body):
	if "costriangle" in body:
		body.hit()
		$Sprite2D.visible = false
		explode()
	else:
		queue_free()
	


func _on_timer_timeout():
	queue_free()

func explode():
	speed = 0
	$lightingExplosion.visible = true
	$AnimationPlayer.play("lightinexplosion")
	

func explosionNoise():
	$AudioStreamPlayer.play()
