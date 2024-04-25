extends Control

# Node References
var cam 

var dist
var bestdist

var height
var bestheight

# Just setting references for optimization purposes
func _ready():
	cam = $"../../../Camera"
	
	dist = $DistHUD/Distance
	bestdist = $DistHUD/BestDistance
	height = $HeightHUD/Height
	bestheight = $HeightHUD/BestHeight
	

	
func _on_gamemode_1_begin_game():
	set_process(true)
	bestdist.text = "Best: " + str(cam.current_best_distance)
	bestheight.text = "Best: " + str(cam.current_best_height)
	show()


func _on_gamemode_1_game_lost():
	set_process(false)
	hide()
	
# Scores obtained from camera, which does the math.
func _process(_delta):
	dist.text = str(cam.player_distance)
	height.text = str(cam.player_height)
	
