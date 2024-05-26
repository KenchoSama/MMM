extends Area2D

signal coin_collected
var gamemode1: bool = false


func _ready():
	if get_tree().get_root().get_child(0).name == "Gamemode 1":
		gamemode1 = true
		
	$Coin.play()
	
func _on_body_entered(body):
	if body is CharacterBody2D or (gamemode1 and body is RigidBody2D):
		coin_collected.emit()
		queue_free()
