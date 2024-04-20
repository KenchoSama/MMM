extends Button


var can_jump: bool = true

func _on_button_down():
	if can_jump:
		can_jump = false
		$Jump.hide()
		$TimerText.show()
		$TimerText.countdown()
		$JumpTimer.start()
		
	


func _on_jump_timer_timeout():
	can_jump = true
	$Jump.show()
	$TimerText.hide()
