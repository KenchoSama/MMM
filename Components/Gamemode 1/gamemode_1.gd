extends Node2D
var player: RigidBody2D = null

func _ready():
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
		player.queue_free()
		
	player = load("res://Components/Gamemode 1/WizardRigidBodyGamemode1.tscn").instantiate()
	player.connect("lost", _on_player_lost)
	player.add_child(load("res://Components/Gamemode 1/WizardSprites.tscn").instantiate()) # TODO load sprites from user disk instead
	
	
	# Update camera's followed player
	$Camera.player = player
	add_child(player)
	

func _on_player_lost():
	print("Lost.")
	pass # Replace with function body.
