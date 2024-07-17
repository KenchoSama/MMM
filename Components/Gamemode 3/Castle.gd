extends Area2D

var hp
signal lost
# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 2 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp <= 0:
		emit_signal("lost")


func _on_body_entered(body):
	if "costriangle" in body:
		hp = hp - 1 # Replace with function body.
		body.hit()
	if "sintriangle" in body:
		hp = hp - 1
		body.hit()
	if "tantriangle" in body:
		hp = hp - 1
		body.hit()
