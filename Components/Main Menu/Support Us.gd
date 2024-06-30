extends Button

func _ready():
	$Control.hide()
	


func _on_button_up():
	$Control.show()

func _on_close_button_up():
	$Control.hide()
