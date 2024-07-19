extends Node2D

var redbar = preload("res://assets/redbar.png")
var greenbar = preload("res://assets/greenbar.png")
var orangebar = preload("res://assets/orangebar.png")
var healthbar
var maxhealth
# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar = $"Health Bar"

func init_bar(value):
	healthbar.texture_progress = greenbar
	healthbar.value = value
	healthbar.max_value = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func update_healthbar(value):
	if value > healthbar.max_value * 0.7:
		healthbar.texture_progress = greenbar
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = orangebar
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = redbar
	if value < healthbar.max_value:
		healthbar.value = value
