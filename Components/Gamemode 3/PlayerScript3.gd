extends CharacterBody2D


var speed = 300
var target = position
var spellcooldown: bool = true
signal lost
signal firespellActivated(pos, direction)
signal spellReleased
signal lightingspellActivated(pos, direction)
signal waterspellActivated(pos, direction)
# Check if the player direction's x component is negative
var player_direction = (get_global_mouse_position() - position).normalized()


func _ready():
	set_physics_process(false)

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		target = event.get_position()
	elif event is InputEventScreenDrag:
		target = event.get_position()

func _physics_process(_delta):
	
	#move and look
	velocity = position.direction_to(target) * speed
	var player_sprite = $Sprites
	# Check if the player direction's x component is negative
	var player_direction = (get_global_mouse_position() - position).normalized()
	if player_direction.x < 0:
		player_sprite.scale.y = -1
	else:
	# Reset the player sprite scale if the direction is not negative
		player_sprite.scale.y = 1

	if position.distance_to(target) > 20:
		move_and_slide()
		
		#rotate wizard
	look_at(get_global_mouse_position())
	#activation of spells
	#var spell_type = get_mouse_input_action()
	var spell_marker = $spellposition.get_children()

	if Input.is_key_pressed(KEY_Q) and spellcooldown:
		spellcooldown = false
		$SpellTimer1.start()
		firespellActivated.emit(spell_marker[0].global_position, player_direction)
	elif Input.is_key_pressed(KEY_W) and spellcooldown:
		spellcooldown = false
		$SpellTimer1.start()
		lightingspellActivated.emit(spell_marker[0].global_position, player_direction)
	elif Input.is_key_pressed(KEY_E) and spellcooldown:
		spellcooldown = false
		$SpellTimer1.start()
		waterspellActivated.emit(spell_marker[0].global_position, player_direction)
		

func _on_spell_timer_1_timeout():
	spellcooldown = true



func _on_area_2d_body_entered(body):
	if "sintriangle" in body:
		queue_free()
		print("body was crushed")
		emit_signal("lost")
	elif "costriangle" in body:
		queue_free()
		print("body was crushed")
		emit_signal("lost")
	elif "tantriangle" in body:
		queue_free()
		print("body was crushed")
		emit_signal("lost")


func _on_start_button_up():
	$AudioStreamPlayer2D.play()
	set_physics_process(true)




func _on_firebutton_button_down():
	if spellcooldown:
		spellcooldown = false
		$SpellTimer1.start()
		firespellActivated.emit($spellposition.get_children()[0].global_position, (get_global_mouse_position() - position).normalized())


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()


func _on_button_button_up():
	$AudioStreamPlayer2D.play()
	set_physics_process(true)
