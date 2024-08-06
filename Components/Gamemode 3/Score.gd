extends Label

var current_best
var current
func _on_pregame():
	# Update every pregame in case new high score changed.
	var cfg = ConfigFile.new()
	cfg.load("user://PlayerData.cfg")
	current_best = cfg.get_value("GM3Score", "best", 0)
	$"../../Pause Menu/BoundingBox/HighScore".text = str(current_best)
	
func _on_loss():
	# Terrible practice. Don't care.
	current = $"../../../../TriangleHandler".triangleElims
	
	if current > current_best:
		current_best = current
		var cfg = ConfigFile.new()
		cfg.load("user://PlayerData.cfg")
		cfg.set_value("GM3Score", "best", current_best)
		cfg.save("user://PlayerData.cfg")
	
	$"../../DeathScreen/Panel/ScoreBounder/Label/BestDist".text = str(current_best)
	$"../../DeathScreen/Panel/ScoreBounder/Label2/YourDist".text = str(current)
	$"../../Pause Menu/BoundingBox/HighScore".text = str(current_best)
	
	

	
