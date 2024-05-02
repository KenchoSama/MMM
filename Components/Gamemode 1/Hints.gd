extends Panel

var showing = false
func _on_hints_button_up():
	if showing:
		hide()
		showing = false
	else:
		show()
		showing = true
