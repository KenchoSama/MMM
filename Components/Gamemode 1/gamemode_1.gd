extends Node2D
var player: RigidBody2D = null

var WizardSprites # WizardSprites child, moved manually or moved in accordance with the rigidbody.

signal preGame # Amplitude / frequency setting
signal beginGame # Generate waves and initiate begin animation
signal gameLost # The world will handle the loss condition. The player does the math to figure out that he's lost

func _ready():
	set_process(false)
	WizardSprites = load("res://Reusable Scenes/Player/WizardSprites.tscn").instantiate()
	emit_signal("preGame") 
	
	
# What happens when a player begins the game:
# - Show inital UI (set amplitude, set wavelength, play)
# - Reset camera position.
# - Add rigidbody character, spawns atop ramp, player launches them into the sea 

# What happens when a player loses the game:
# - Update high scores (distance travelled, highest attained height) 
# - Show death UI (replay button, menu button, hints button) 
# - Camera stays in place until call to begin game.
# - Player rigidbody sinks, then is released from tree.

var follow_rigidbody: bool = false
func _process(_delta):
	WizardSprites.position = beginGame

func begin_game():
	# Delete old rigidbody, if it exists. 
	
	# Recreate rigidbody.
	player = load("res://Components/Gamemode 1/WizardRigidBodyGamemode1.tscn").instantiate()
	player.position = Vector2(250,-450)
	player.connect("lost", _on_player_lost)
	player.connect("shift_waves", $Wave._shift_wave_right)
	
	emit_signal("beginGame")
	
	player.calculated_period_length = $Wave.calculated_period_length
	
	# Update camera's followed player
	$Camera.player = player
	add_child(player)
	
func _on_restart():
	if player != null:
		player.queue_free()
	emit_signal("preGame")

# Todo, will eventually call to update high scores
func _on_player_lost():
	emit_signal("gameLost")
	pass # Replace with function body.
