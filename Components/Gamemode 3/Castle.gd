extends Area2D

var hp = 100
signal lost

# The castle script handles the loss condition and tracks hp. 
func _on_begin_game():
	$AnimationPlayer.play("floating")
	hp = 100
	
	
# On a triangle hitting the castle, reduce the castle's health.
# Any body that enters the castle is going to be one of the triangles by design. So call its "hit" method
func _on_body_entered(body): 
	hp -= 10
	$AnimationPlayer.play("hit animation")
	body.hit()
	
	$"../../UI Layer/Control/HUD/Bars".update_healthbar(hp)
	#if hp < 80:
	if hp <= 0:
		emit_signal("lost")

# Castle signals up to gm3 script, which then signals down to all necessary nodes.


func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer.play("floating") # Replace with function body.
