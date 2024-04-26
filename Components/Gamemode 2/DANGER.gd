extends Label

var hideTimer
var showTimer
var flashTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	hideTimer = $HideTimer
	showTimer = $ShowTimer
	flashTimer = $FlashTimer
	hide()

func flash():
	showTimer.start(0.2)
	flashTimer.start($"../../../Laser Cannon".countDown)
	

func _process(delta):
	pass


func _on_show_timer_timeout():
	show()
	hideTimer.start(0.2) # Replace with function body.


func _on_flash_timer_timeout():
	showTimer.stop()
	hideTimer.stop()
	hide()


func _on_hide_timer_timeout():
	hide()
	showTimer.start(0.2)
