extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("SuperLaser") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	body.hit() # Replace with function body.

func setSpellFalse():
	get_tree().call_group("GameMethod","endSuper")
