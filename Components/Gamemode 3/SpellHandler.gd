extends Node2D

const fireSpell: PackedScene = preload("res://Components/Gamemode 3/fire.tscn")
const lightingSpell: PackedScene = preload("res://Components/Gamemode 3/lighting.tscn")
const waterSpell: PackedScene = preload("res://Components/Gamemode 3/water.tscn")
const superSpell: PackedScene = preload("res://Components/Gamemode 3/SuperLaser.tscn")

#-----------------------------------Signals to create spells ------------------------------------#
func _on_player_firespell_activated(pos, direction):
	#print("spell activated from the gamemode script")
	var spell = fireSpell.instantiate()
	spell.position = pos
	spell.rotation_degrees = rad_to_deg(direction.angle()) + 90
	spell.direction = direction
	add_child(spell)

func _on_player_lightingspell_activated(pos, direction):
	#print("spell activated from the gamemode script")
	var spell = lightingSpell.instantiate()
	spell.position = pos
	spell.rotation_degrees = rad_to_deg(direction.angle())
	spell.direction = direction
	add_child(spell)
	

func _on_player_waterspell_activated(pos, direction):
	#print("spell activated from the gamemode script")
	var spell = waterSpell.instantiate()
	spell.position = pos
	spell.rotation_degrees = rad_to_deg(direction.angle())
	spell.direction = direction
	add_child(spell)

func _on_player_super_spell_activated():
	var spell = superSpell.instantiate()
	add_child(spell) # Replace with function body.
