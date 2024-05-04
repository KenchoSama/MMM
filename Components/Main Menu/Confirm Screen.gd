extends Panel

# User has pressed a button.
signal confirmed

func _on_no_button_up():
	emit_signal("confirmed", 0)
	queue_free()


func _on_yes_button_up():
	emit_signal("confirmed", 1)
	queue_free()
