extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ray_cast_2d_loss():
	show() # Replace with function body.


func _on_gamemode_2_begin_game():
	hide() # Replace with function body.
