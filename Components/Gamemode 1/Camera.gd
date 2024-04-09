extends Camera2D

@export var player: RigidBody2D
@export var wave: Node2D # temp
var player_height: int

#func _ready():
	#offset = get_screen_center_position()
	
func _process(delta):
	#position = player.position
	position.x = player.position.x
	
	player_height = -1 * int(player.position.y - wave.position.y)
	print(player_height)
	position.y = lerp(wave.position.y, player.position.y, 0.5)
