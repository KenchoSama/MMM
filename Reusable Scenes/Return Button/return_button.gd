extends Button



func _on_toggled(_button_press):
	get_tree().change_scene_to_file("res://Components/Main Menu/main_menu.tscn")


func _on_home_button_up():
	get_tree().change_scene_to_file("res://Components/Main Menu/main_menu.tscn")
