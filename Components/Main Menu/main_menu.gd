extends Control

# TODO should load on startup:
# Customization options
# High scores
# Currency (when implemented)
var streamPlayer
# If there is no PlayerData file, then it's the user's first time booting the game. Initialize it.
func _ready():
	Engine.max_fps = 60
	RenderingServer.set_default_clear_color(Color.CYAN)
	var PlayerData = ConfigFile.new()
	var err = PlayerData.load("user://PlayerData.cfg")
	streamPlayer = $AudioStreamPlayer2D
	
	
	if err != OK: # First time booting (or some error, shouldn't happen) save config file first, then load it.
		PlayerData.set_value("CustomSprites", "skin", "res://Reusable Scenes/Player/Sprites/Skin/DefaultSkin.png")
		PlayerData.set_value("CustomSprites", "hat", "res://Reusable Scenes/Player/Sprites/Hats/DefaultHat.png")
		PlayerData.set_value("CustomSprites", "facialhair", "res://Reusable Scenes/Player/Sprites/Facial Hair/DefaultBeard.png")
		PlayerData.set_value("CustomSprites", "shirt", "res://Reusable Scenes/Player/Sprites/Shirts/DefaultRobe.png")
		PlayerData.save("user://PlayerData.cfg")
		# TODO set appropriate high scores, currency to default
	
	# TODO read appropriate high scores, currency
	
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

func _on_mute_button_button_up():
	if streamPlayer.volume_db == -99.0:
		streamPlayer.volume_db = -32.0
	elif streamPlayer.volume_db == -32.0:
		streamPlayer.volume_db = -99.0


func _on_audio_stream_player_2d_finished():
	streamPlayer.play()


func _on_loop_timer_timeout():
	pass #add timer to audio stream player if desire unloopable song
