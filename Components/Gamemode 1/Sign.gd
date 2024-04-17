extends Sprite2D

func _on_pregame():
	generate_sign()


const options = [
	Rect2(64,0,64,64),
	Rect2(128,0,64,64),
	Rect2(0,64,64,64),
	Rect2(64,64,64,64),
	Rect2(128,64,64,64),
	Rect2(0,128,64,64)
]

func generate_sign():
	texture.region = options.pick_random()
	
