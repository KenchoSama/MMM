extends CharacterBody2D


const SPEED = 100.0
var player
var player_position
var target_position
var rng
var xstart
var ystart
var lossMessage

const lossMessages = [
	"Abducted by aliens :(",
	"Was it too shiny?",
	"A NEW TEST SUBJECT!",
	"^-?!*.Glorp Glirp."
]

func _ready():
	player = $"../Player"
	position = Vector2(0,0)
	set_physics_process(false)
	rng = RandomNumberGenerator.new()

func _physics_process(delta):
	player_position = player.position
	
	velocity = position.direction_to(player_position) * SPEED
	if position.distance_to(player_position) > 0:
		move_and_slide()
	


func _on_gamemode_2_begin_game():
	position = Vector2(750,500) # Replace with function body.
	xstart = rng.randi_range(-10, 1200)
	if rng.randi_range(0,1):
		ystart = -10
	else:
		ystart = 658
	position = Vector2(xstart, ystart)
	set_physics_process(true)


func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		lossMessage = lossMessages.pick_random()
		$"../UI Layer/Debug/DeathScreen/LossMessage".set_text(lossMessage)
		$"../Laser Cannon/RayCast2D".loss.emit()
		set_physics_process(false)


func _on_ray_cast_2d_loss():
	set_physics_process(false) # Replace with function body.
