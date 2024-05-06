extends Button

class_name ClickerButton

var click
func _ready():
	click = preload("res://Reusable Scenes/ButtonClick.mp3")
	
	
func _on_button_up():
	click.play(0)
	print("Here")
