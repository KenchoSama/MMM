extends Node2D

@export var speed: int = 300
var direction = Vector2.RIGHT
var collission

func _ready():
	# Start a Timer to delete the node after 2 seconds
	$Timer.start()
	$lightingExplosion.visible = false
	collission = false

func _process(delta):
	position += direction * delta * speed
	


func _on_area_2d_body_entered(body):
	if "costriangle" in body and !collission:
		body.hit()
		collission = true
		$Sprite2D.visible = false
		explode()
		get_tree().call_group("Player","mana_update",5)
		get_tree().call_group("Player","super_update",10)
		get_tree().call_group("GameMethod","addElim")
	if "sintriangle" in body and !collission:
		get_tree().call_group("Player","super_update",-20)
		$Sprite2D.visible = false
		collission = true
		$spellFailSound.play()
	if "tantriangle" in body and !collission:
		get_tree().call_group("Player","super_update",-20)
		$Sprite2D.visible = false
		collission = true
		$spellFailSound.play()
	


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


func _on_spell_fail_sound_finished():
	queue_free() # Replace with function body.
