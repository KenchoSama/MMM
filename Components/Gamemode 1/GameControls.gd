extends Control

# Node References
var cam 

var dist
var bestdist

var height
var bestheight

# Just setting references for optimization purposes
func _ready():
	hide()
	cam = $"../../../Camera"
	
	dist = $DistHUD/Distance

	
func _on_gamemode_1_begin_game():
	set_process(true)
	$DistHUD/HighScoreRun.hide()
	show()


func _on_gamemode_1_game_lost(_pos):
	set_process(false)
	hide()
	
# Scores obtained from camera, which does the math.
func _process(_delta):
	dist.text = str(max(0, cam.player_distance))
	
