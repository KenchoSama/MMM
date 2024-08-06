extends Area2D

var hp = 100
signal lost
const damage = [
	Rect2(0,0,64,64),
	Rect2(64,0,64,64),
	Rect2(128,0,64,64),
	Rect2(192,0,64,64),
	Rect2(256,0,64,64),
	Rect2(320,0,64,64),
	Rect2(384,0,64,64),
	Rect2(448,0,64,64)
]

# The castle script handles the loss condition and tracks hp. 
func _on_begin_game():
	hp = 100
	

func _on_gamemode_3_pregame():
	$CastleSprite.texture.region = damage[0]
	$AnimationPlayer.play("floating")

# On a triangle hitting the castle, reduce the castle's health.
# Any body that enters the castle is going to be one of the triangles by design. So call its "hit" method
func _on_body_entered(body): 
	hp -= 10
	$AnimationPlayer.play("hit animation")
	body.hit()
	
	$"../../UI Layer/Control/HUD/Bars".update_healthbar(hp)
	
	
	if hp >= 80:
		$CastleSprite.texture.region = damage[0]
	elif hp >= 60:
		$CastleSprite.texture.region = damage[1]
	elif hp >= 50:
		$CastleSprite.texture.region = damage[2]
	elif hp >= 40:
		$CastleSprite.texture.region = damage[3]
	elif hp >= 30:
		$CastleSprite.texture.region = damage[4]
	elif hp >= 20:
		$CastleSprite.texture.region = damage[5]
	elif hp >= 10:
		$CastleSprite.texture.region = damage[6]
	if hp <= 0:
		$CastleSprite.texture.region = damage[7]
		emit_signal("lost")

# Castle signals up to gm3 script, which then signals down to all necessary nodes.


func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer.play("floating") # Replace with function body.

