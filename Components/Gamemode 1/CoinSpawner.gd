extends Node2D


# Instancing and spawning in world. 
var coin_scene = preload("res://coin.tscn")

func spawn_coin(pos: Vector2):
	var new_coin = coin_scene.instantiate()
	new_coin.coin_collected.connect(self.coin_collected)
	add_child(new_coin)
	new_coin.global_position = pos
	
func spawn_event(): # Called with every signal to shift waves.
	var choice = randi() % 5 + 1
	match choice:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		_:
			pass

# Coin collection and saving. 
var coins_in_current_run = 0
	
func _on_gamemode_1_pre_game():
	coins_in_current_run = 0

func _on_gamemode_1_game_lost(_pos):
	
	# Update coin total. 
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	var new_total = cfg.get_value("Coins", "coins", 0) + coins_in_current_run
	cfg.set_value("Coins", "coins", new_total)
	cfg.save("user://PlayerData.cfg")
	


func coin_collected():
	coins_in_current_run += 1
	
