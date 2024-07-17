extends Node2D

@export var speed: int = 300
var direction = Vector2.RIGHT


func _ready():
	# Start a Timer to delete the node after 2 seconds
	$Timer.start()
	$lightingExplosion.visible = false

func _process(delta):
	position += direction * delta * speed
	


func _on_area_2d_body_entered(body):
	if "costriangle" in body:
		body.hit()
		$Sprite2D.visible = false
		explode()
	if "sintriangle" in body:
		queue_free()
	if "tantriangle" in body:
		queue_free()
	


func _on_timer_timeout():
	queue_free()

func explode():
	speed = 0
	$lightingExplosion.visible = true
	$AnimationPlayer.play("lightinexplosion")
	

func explosionNoise():
	$AudioStreamPlayer.play()
	



func _on_animation_player_animation_finished(anim_name):
	queue_free()# Replace with function body.
