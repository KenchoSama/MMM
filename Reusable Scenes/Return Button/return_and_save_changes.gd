extends Button

# Return and save changes is used only by the character customizer. 
func _on_toggled(button_pressed):
	get_tree().change_scene_to_file("res://Components/Main Menu/main_menu.tscn")
