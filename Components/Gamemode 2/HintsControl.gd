extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_hints_button_up():
	hide() # Replace with function body.


func _on_hints_button_button_up():
	show() # Replace with function body.
