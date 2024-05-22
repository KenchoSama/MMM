extends Node2D

# Character will be initialized on game start. Display on left side. 

# Save data will be a dictionary of filepath strings, like so:
# skin : "path"
# hat : "path"
# facialhair : "path"
# shirt : "path"

# Filepaths, changed by input to UI.
var skin_texture
var hat_texture
var facialhair_texture
var shirt_texture


func _ready():
	# Load current choices from user disk.
	var cfg = ConfigFile.new()
	var err = cfg.load("user://PlayerData.cfg")
	if err != OK:
		printerr(err) # Shouldn't happen.
		return 
	
	skin_texture = load(cfg.get_value("CustomSprites", "skin"))
	hat_texture = load(cfg.get_value("CustomSprites", "hat"))
	facialhair_texture = load(cfg.get_value("CustomSprites", "facialhair"))
	shirt_texture = load(cfg.get_value("CustomSprites", "shirt"))
	
	$Coins/Coins.text = str(cfg.get_value("Coins", "coins", 0))
	$Coins/Coin.play()
	



func _on_skin_item_selected(index):
	var newpath = "res://Reusable Scenes/Player/Sprites/Skin/Skin" + str(index + 1) + ".png"
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	cfg.set_value("CustomSprites", "skin", newpath)
	cfg.save("user://PlayerData.cfg")
		
	$WizardSprites.load_sprites()




func _on_hats_item_selected(index):
	var newpath = "res://Reusable Scenes/Player/Sprites/Hats/Hat" + str(index + 1) + ".png"
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	cfg.set_value("CustomSprites", "hat", newpath)
	cfg.save("user://PlayerData.cfg")
		
	$WizardSprites.load_sprites()




func _on_beards_item_selected(index):
	var newpath = "res://Reusable Scenes/Player/Sprites/Facial Hair/Beard" + str(index + 1) + ".png"
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	cfg.set_value("CustomSprites", "facialhair", newpath)
	cfg.save("user://PlayerData.cfg")
		
	$WizardSprites.load_sprites()

const colors = {
	0 : Color.WHITE,
	1 : Color.DIM_GRAY,
	2 : Color("202020"),
	3 : Color.BURLYWOOD,
	4 : Color.ORANGE,
	5 : Color.ORANGE_RED,
	6 : Color.CORNFLOWER_BLUE,
	7 : Color.GREEN
}
func _on_beard_colors_item_selected(index):
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	cfg.set_value("CustomSprites", "haircolor", colors[index])
	cfg.save("user://PlayerData.cfg")
	
	$WizardSprites.load_sprites()
	
	


func _on_shirts_item_selected(index):
	var newpath = "res://Reusable Scenes/Player/Sprites/Shirts/Shirt" + str(index + 1) + ".png"
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	cfg.set_value("CustomSprites", "shirt", newpath)
	cfg.save("user://PlayerData.cfg")
		
	$WizardSprites.load_sprites()


func _on_shop_theme_finished():
	$ShopTheme.play(0) # Replace with function body.
