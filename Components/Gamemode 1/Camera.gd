extends Camera2D

@export var player: RigidBody2D
@export var wave: Node2D # temp
var player_height: int

#func _ready():
	#offset = get_screen_center_position()
	
func _process(delta):
	#position = player.position
	if player != null:
		position.x = player.position.x

		player_height = -1 * int(player.position.y - wave.position.y)
		#print(player_height)
		
		if player_height < 1000: 
			position.y = lerp(wave.position.y, player.position.y, 0.5)
		
		if player_height > 500:
			if player_height < 1000:
				zoom.x = max(0.2, 1 - ((player_height - 500) * 0.001))
				zoom.y = max(0.2, 1 - ((player_height - 500) * 0.001))
	
