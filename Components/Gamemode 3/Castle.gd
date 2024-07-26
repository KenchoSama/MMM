extends Area2D

var hp = 100
signal lost

# The castle script handles the loss condition and tracks hp. 
func _on_begin_game():
	hp = 100
	
	
# On a triangle hitting the castle, reduce the castle's health.
# Any body that enters the castle is going to be one of the triangles by design. So call its "hit" method
func _on_body_entered(body): 
	hp -= 50
	body.hit()
	
	$"../../UI Layer/Control/HUD/Bars".update_healthbar(hp)
	if hp <= 0:
		emit_signal("lost")

# Castle signals up to gm3 script, which then signals down to all necessary nodes.
