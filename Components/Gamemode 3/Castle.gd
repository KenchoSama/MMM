extends Area2D

var hp
signal lost
# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 100 # Replace with function body.
	$"Health Display".init_bar(hp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp <= 0:
		emit_signal("lost")


func _on_body_entered(body):
	if "costriangle" in body:
		hp = hp - 5 # Replace with function body.
		body.hit()
	if "sintriangle" in body:
		hp = hp - 5
		body.hit()
	if "tantriangle" in body:
		hp = hp - 5
		body.hit()
	$"Health Display".update_healthbar(hp)
