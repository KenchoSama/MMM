extends CharacterBody2D


var speed = 300
var target = position
var spelltarget = Vector2(0,324)
var mana
var maxMana
var bars
var superMana
var firespell : bool = true
var waterspell : bool = true
var lightningspell : bool = true
signal firespellActivated(pos, direction)
signal spellReleased
signal lightingspellActivated(pos, direction)
signal waterspellActivated(pos, direction)
# Check if the player direction's x component is negative
var player_direction = (get_global_mouse_position() - position).normalized()


func _ready():
	maxMana = 100
	mana = maxMana
	superMana = 0
	bars = $"../Bars"
	bars.init_manabar(maxMana)
	bars.init_super(maxMana)
	set_physics_process(false)

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		target = event.get_position()
	elif event is InputEventScreenDrag:
		target = event.get_position()

func _physics_process(_delta):
	mana_update(0.05)
	#move and look
	velocity = position.direction_to(target) * speed
	var player_sprite = $Sprites
	# Check if the player direction's x component is negative
	var player_direction = (target - position).normalized()
	if player_direction.x < 0:
		player_sprite.scale.y = -1
	else:
	# Reset the player sprite scale if the direction is not negative
		player_sprite.scale.y = 1
		#rotate wizard
	if target.y < 474 && target.y > 174:
		look_at(target)
		spelltarget = target
	#activation of spells
	#var spell_type = get_mouse_input_action()
	var spell_marker = $spellposition.get_children()

	if Input.is_key_pressed(KEY_Q) and mana > 20 and firespell:
		mana_update(-10)
		$firecd.start(1)
		firespell = false
		firespellActivated.emit(spell_marker[0].global_position, player_direction)
	elif Input.is_key_pressed(KEY_W) and mana > 20 and lightningspell:
		mana_update(-10)
		$lightningcd.start(1)
		lightningspell = false
		lightingspellActivated.emit(spell_marker[0].global_position, player_direction)
	elif Input.is_key_pressed(KEY_E) and mana > 20 and waterspell:
		mana_update(-10)
		$watercd.start(1)
		waterspell = false
		waterspellActivated.emit(spell_marker[0].global_position, player_direction)
		

func super_update(value):
	superMana += value
	if superMana > 100:
		superMana = 100
	elif superMana < 0:
		superMana = 0
	bars.update_super(superMana)
	
func mana_update(value):
	mana += value
	if mana > maxMana:
		mana = maxMana
	bars.update_manabar(mana)

func _on_start_button_up():
	$AudioStreamPlayer2D.play()
	set_physics_process(true)


func _on_firebutton_button_down():
	if firespell:
		mana_update(-10)
		$firecd.start(1)
		firespell = false
		firespellActivated.emit($spellposition.get_children()[0].global_position, (spelltarget - position).normalized())


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()


func _on_button_button_up():
	$AudioStreamPlayer2D.play()
	set_physics_process(true)


func _on_lightingbutton_button_down():
	if lightningspell:
		mana_update(-10)
		$lightningcd.start(1)
		lightningspell = false
		lightingspellActivated.emit($spellposition.get_children()[0].global_position, (spelltarget - position).normalized())


func _on_waterbutton_button_down():
	if waterspell:
		mana_update(-10)
		$watercd.start(1)
		waterspell = false
		waterspellActivated.emit($spellposition.get_children()[0].global_position, (spelltarget - position).normalized())


func _on_firecd_timeout():
	firespell = true # Replace with function body.


func _on_lightningcd_timeout():
	lightningspell = true # Replace with function body.
	
	
func _on_watercd_timeout():
	waterspell = true # Replace with function body.
