extends Button



func _on_toggled(_button_press):
	get_tree().change_scene_to_file("res://Components/Main Menu/main_menu.tscn")
