extends Camera2D

@export var player: CharacterBody2D
@export var wave: Node2D # temp

func _ready():
	offset = get_screen_center_position()
	
func _process(delta):
	position.x = lerp(self.position.x, player.position.x, 0.5)
	position.y = lerp(0.0, player.position.y, 0.5)
