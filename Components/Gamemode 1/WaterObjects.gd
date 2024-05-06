extends Node2D

const positions = [Vector2(0,0), Vector2(0,40), Vector2(0,100)]
const regions = [Rect2(Vector2(0,0),Vector2(64,64)), Rect2(Vector2(64,0),Vector2(64,64)), Rect2(Vector2(0,64),Vector2(64,64))]
var sprite
var timer

func _ready():
	sprite = $Object
	timer = $Timer


func _on_pregame():
	change_object()
	
func change_object():
#	timer.start(randi_range(3,5))
#	await timer.timeout
	
	sprite.position = positions.pick_random()
	sprite.texture.region = regions.pick_random()
	sprite.flip_h = randi_range(0,1)
	
func _on_loss(_pos):
	timer.stop
