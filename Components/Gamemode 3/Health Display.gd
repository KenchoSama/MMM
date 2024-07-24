extends Node2D

var redbar = preload("res://assets/redbar.png")
var greenbar = preload("res://assets/greenbar.png")
var orangebar = preload("res://assets/orangebar.png")
var bluebar = preload("res://assets/bluebar.png")
var healthbar
var manabar
# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar = $"Health Bar"
	manabar = $"Mana Bar"

func init_bar(value):
	healthbar.texture_progress = greenbar
	healthbar.value = value
	healthbar.max_value = value
# Called every frame. 'delta' is the elapsed time since the previous frame.

func init_manabar(value):
	manabar.texture_progress = bluebar
	manabar.value = value
	manabar.max_value = value
func _process(delta):
	pass
	
func update_manabar(value):
	manabar.value = value

func update_healthbar(value):
	if value > healthbar.max_value * 0.7:
		healthbar.texture_progress = greenbar
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = orangebar
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = redbar
	if value < healthbar.max_value:
		healthbar.value = value
