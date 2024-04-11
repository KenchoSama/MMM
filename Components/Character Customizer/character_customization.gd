extends Node2D

# Character will be initialized on game start. Display on left side. 

# Save data will be a dictionary of filepath strings, like so:
# skin : "path"
# hat : "path"
# facialhair : "path"
# shirt : "path"

# Filepaths, changed by input to UI.
var skin_texture: Texture2D = "res://Reusable Scenes/Player/Sprites/Skin/DefaultSkin.png"
var hat_texture: Texture2D = "res://Reusable Scenes/Player/Sprites/Hats/DefaultHat.png"
var facialhair_texture: Texture2D = "res://Reusable Scenes/Player/Sprites/Facial Hair/DefaultBeard.png"
var shirt_texture: Texture2D = "res://Reusable Scenes/Player/Sprites/Shirts/DefaultRobe.png"


func _ready():
	# TODO load current choices from user disk.
	# dict = ?
	
# Called on change scene. 
func save_choices():
	#TODO write chosen filepaths to user disk. 
	var customization_data = {
		skin = skin_texture,
		hat = hat_texture,
		facialhair = facialhair_texture,
		shirt = shirte_texture
	}
	pass

