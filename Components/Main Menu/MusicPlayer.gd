extends Button

var setting_name # The string name of the setting. Used by the music player for each gamemode.
var streamPlayer
var PlayerData
func _ready():
	setting_name = get_tree().root.get_child(0).name + "_muted"
	
	streamPlayer = $AudioStreamPlayer
	PlayerData = ConfigFile.new()
	PlayerData.load("user://PlayerData.cfg")
	
	var check = PlayerData.get_value("Settings", setting_name, false)
	if check == false:
		icon = load("res://assets/unmuted.png")
		streamPlayer.volume_db = -32.0
	elif check == true:
		icon = load("res://assets/muted.png")
		streamPlayer.volume_db = -99.0
	
func _on_mute_button_button_up():
	PlayerData = ConfigFile.new()
	PlayerData.load("user://PlayerData.cfg")
	
	if streamPlayer.volume_db == -99.0: # Muted to unmuted
		icon = load("res://assets/unmuted.png")
		streamPlayer.volume_db = -32.0
		PlayerData.set_value("Settings", setting_name, false)
	elif streamPlayer.volume_db == -32.0: # Unmuted to muted
		icon = load("res://assets/muted.png")
		streamPlayer.volume_db = -99.0
		PlayerData.set_value("Settings", setting_name, true)
	PlayerData.save("user://PlayerData.cfg")
