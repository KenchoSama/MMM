extends Button

func _on_button_up():
	# Display confirmation screen. 
	var confirmer = load("res://Reusable Scenes/confirm_screen.tscn").instantiate()
	confirmer.confirmed.connect(wipe_scores)
	confirmer.top_level = true
	$"../Close".connect("button_up", confirmer.queue_free)
	$"../../../Settings Button".connect("button_up", confirmer.queue_free)
	add_child(confirmer)

func wipe_scores(selection):
	if selection == 0:
		return
	elif selection == 1:
		var cfg = ConfigFile.new()
		cfg.load("user://PlayerData.cfg")
		cfg.set_value("GM2Score", "score", 0)
		cfg.save("user://PlayerData.cfg")
		print("Wiped score.")
