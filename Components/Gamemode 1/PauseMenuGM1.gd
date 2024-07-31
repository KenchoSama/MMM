extends TextureButton

const pausedIcon = preload("res://Reusable Scenes/Pause.png")
const pixelArtUI = preload("res://Reusable Scenes/PixelArtUI.png")
var playIcon
var paused = false

func _ready():
	playIcon = AtlasTexture.new()
	playIcon.atlas = pixelArtUI
	playIcon.region = Rect2(0,0,32,32)
	$BoundingBox.hide()

func _on_button_up():
	if paused:
		# Unpause
		get_tree().paused = false
		paused = false
		$BoundingBox.hide()
		texture_normal = pausedIcon
	else:
		# Pause
		get_tree().paused = true
		paused = true
		$BoundingBox.show()
		texture_normal = playIcon
