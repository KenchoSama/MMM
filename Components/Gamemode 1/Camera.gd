extends Camera2D

@export var player: RigidBody2D
@export var wave: Node2D # temp
var player_height: int

func _pregame_begin():
	set_process(false)
	zoom = Vector2(1,1)
	offset = Vector2(200, -150) # Offset above at start
	position = Vector2(250,-428)
	
func _game_begin():
	fixing_offset = true
	set_process(true)

var fixing_offset = false
func _process(delta):
	#position = player.position
	if player != null:
		position.x = player.position.x
		player_height = -1 * int(player.position.y - wave.position.y)
		$Height.text = str(player_height - 1400)
		
		# Shifting inital offset to game offset
		if fixing_offset:
			
			position.y = player.position.y
			
			var dist = 450 - player.position.y
			dist *= -1
			#print(dist)
			offset.y = dist / 6
			#print(offset.y)
			if dist >= -6:
				offset.y = 0
				fixing_offset = false
				
		
		else:
			
			var height_to_zoom = 1 - max(player_height, 0) * 0.0005
			zoom.x = max(0.4, height_to_zoom)
			zoom.y = max(0.4, height_to_zoom)
			
			if zoom.x <= 0.42: # Max zoom, drag cam at height 1164, y value -634
				position.y = lerp(wave.position.y, -634.0, 0.5)
				if player_height > 1400:
					$Arrow.show()
					$Height.show()
					var scalefactor = max(2, 5.0 - ((player_height - 1400) / 50) * 0.2)
					$Arrow.scale = Vector2(scalefactor, scalefactor)
				else:
					$Arrow.hide()
					$Height.hide()
					$Arrow.scale = Vector2(5, 5)
			else:
				position.y = lerp(wave.position.y, player.position.y, 0.5)
				
			
			
	
	
