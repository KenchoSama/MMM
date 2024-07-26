extends CharacterBody2D


var speed = 300
var target = position
var spelltarget = Vector2(0,324)
var mana = 0
const maxMana = 100
var bars
var superMana
var firespell : bool = true
var waterspell : bool = true
var lightningspell : bool = true
var superReady : bool = true
signal firespellActivated(pos, direction)
signal spellReleased
signal lightingspellActivated(pos, direction)
signal waterspellActivated(pos, direction)
signal superSpellActivated


func _ready():
	bars = $"../UI Layer/Control/HUD/Bars"
	set_physics_process(false)


func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		target = event.get_position()
	elif event is InputEventScreenDrag:
		target = event.get_position()

func _physics_process(_delta):
	mana_update(0.01)
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
		firespell = false
		mana_update(-10)
		$firecd.start(1)
		firespellActivated.emit(spell_marker[0].global_position, player_direction)
	elif Input.is_key_pressed(KEY_W) and mana > 20 and lightningspell:
		lightningspell = false
		mana_update(-10)
		$lightningcd.start(1)
		lightingspellActivated.emit(spell_marker[0].global_position, player_direction)
	elif Input.is_key_pressed(KEY_E) and mana > 20 and waterspell:
		waterspell = false
		mana_update(-10)
		$watercd.start(1)
		waterspellActivated.emit(spell_marker[0].global_position, player_direction)
	elif Input.is_key_pressed(KEY_R) and superMana >= 100 and superReady:
		superReady = false
		super_update(-100)
		superSpellActivated.emit()
		$SuperCD.start()
		

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


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()

func _on_begin_game():
	$AudioStreamPlayer2D.play()
	set_physics_process(true)
	mana = maxMana
	superMana = 0
	bars.init_manabar(maxMana)
	bars.init_super(maxMana)


# ------------- Spell casting ------------------- #

func _on_firebutton_button_down():
	if firespell:
		mana_update(-10)
		$firecd.start(1)
		firespell = false
		firespellActivated.emit($spellposition.get_children()[0].global_position, (spelltarget - position).normalized())


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
	firespell = true
func _on_lightningcd_timeout():
	lightningspell = true
func _on_watercd_timeout():
	waterspell = true
func _on_super_cd_timeout():
	superReady = true

