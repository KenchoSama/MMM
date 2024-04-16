extends CharacterBody2D
# Write code for the player in gamemode 3 here
var wizard: bool = true
var spellcooldown: bool = true
var primary_action_pressed = false  # Flag to track primary action press state
var speed = 300
#fire spells
signal lost
signal firespellActivated(pos, direction)
signal spellReleased
signal lightingspellActivated(pos, direction)
signal waterspellActivated(pos, direction)

func _process(delta):
	
	#input for move
	#var direction = Input.get_vector("left", "right", "up", "down")
	#position += direction * delta * 400
	#move_and_slide()
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	var motion = input_vector * speed * delta
	var collision = move_and_collide(motion)
	
	#rotate wizard
	look_at(get_global_mouse_position())
	
	#activation of spells
	var spell_type = get_mouse_input_action()
	var spell_marker = $spellposition.get_children()
	var player_direction = (get_global_mouse_position() - position).normalized()
	

	if spell_type == "primary" and spellcooldown:
		spellcooldown = false
		$SpellTimer1.start()
		firespellActivated.emit(spell_marker[0].global_position, player_direction)
		
		
	if spell_type == "secondary" and spellcooldown:
		#print("lighting spell")
		spellcooldown = false
		$SpellTimer1.start()
		lightingspellActivated.emit(spell_marker[0].global_position, player_direction)
		
		
	if spell_type == "thirdAction" and spellcooldown:
		#print("lighting spell")
		spellcooldown = false
		$SpellTimer1.start()
		waterspellActivated.emit(spell_marker[0].global_position, player_direction)
	
	
func _on_spell_timer_1_timeout():
	spellcooldown = true
		

func get_mouse_input_action():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return "primary"
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		return "secondary"
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		return "thirdAction"
	else:
		return "no_input"


func _on_area_2d_body_entered(body):
	
	if "triangle" in body:
		queue_free()
		print("body was crushed")
		emit_signal("lost")
