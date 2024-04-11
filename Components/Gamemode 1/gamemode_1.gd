extends Node2D
var player: RigidBody2D = null
var sprites
signal beginGame

func _ready():
	sprites = load("res://Reusable Scenes/Player/WizardSprites.tscn").instantiate()
	pass # - Show inital UI (set amplitude, set wavelength, play)


func _process(delta):
	if Input.is_key_pressed(KEY_SPACE): #Debug
		begin_game()

# What happens when a player begins the game:
# - Show inital UI (set amplitude, set wavelength, play)
# - Reset camera position.
# - Add rigidbody character, spawns atop ramp, player launches them into the sea 

# What happens when a player loses the game:
# - Update high scores (distance travelled, highest attained height) 
# - Show death UI (replay button, menu button, hints button) 
# - Camera stays in place until call to begin game.
# - Player rigidbody sinks, then is released from tree.


func begin_game():
	if player != null:
		player.remove_child(sprites)
		player.queue_free()
		
	player = load("res://Components/Gamemode 1/WizardRigidBodyGamemode1.tscn").instantiate()
	player.connect("lost", _on_player_lost)
	player.connect("shift_waves", $Wave._shift_wave_right)
	player.add_child(sprites)
	
	
	emit_signal("beginGame")
	
	# Bad practice, probably. Oh well. 
	await($Wave.period_length_known)
	player.calculated_period_length = $Wave.calculated_period_length
	
	# Update camera's followed player
	$Camera.player = player
	add_child(player)
	
	

# Todo, will eventually call to update high scores
func _on_player_lost():
	print("Lost.")
	pass # Replace with function body.
