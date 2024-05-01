extends Node2D

signal startScreen
signal beginGame

# Called when the node enters the scene tree for the first time.
func _ready():
	startScreen.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
# gil was here
func _on_start_button_button_up():
	beginGame.emit() # Replace with function body.


func _on_restart_button_button_up():
	beginGame.emit() # Replace with function body.
