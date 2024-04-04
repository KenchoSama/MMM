extends Control

# TODO should load on startup:
# Customization options
# High scores
# Currency (when implemented)

func _ready():
	pass
	
	
func _process(_delta):
	
	#Implemented this to make our lives easier; pressing escape will exit the program if you're in the main menu
	if Input.is_action_just_pressed("debug_quit"): #See "Input Map" in the project settings to see how I did this
		get_tree().quit()
		
func _on_button_for_gamemode_1_button_up():
	get_tree().change_scene_to_file("res://Components/Gamemode 1/gamemode_1.tscn")


func _on_button_for_gamemode_2_button_up():
	get_tree().change_scene_to_file("res://Components/Gamemode 2/gamemode_2.tscn")


func _on_button_for_gamemode_3_button_up():
	get_tree().change_scene_to_file("res://Components/Gamemode 3/gamemode_3.tscn")


func _on_button_for_gamemode_4_button_up():
	get_tree().change_scene_to_file("res://Components/Gamemode 4/gamemode_4.tscn")
	

func _on_button_for_cc_button_up():
	get_tree().change_scene_to_file("res://Components/Character Customizer/character_customization.tscn")
