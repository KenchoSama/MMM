extends Node2D

# Made by victor, script for character customization, don't change.
# 
# Texture variables given in drawing order
var skin_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Skin/DefaultSkin.png")
var hat_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Hats/DefaultHat.png")
var facialhair_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Facial Hair/DefaultBeard.png")
var shirt_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Shirts/DefaultRobe.png")

# Character customization options will be an array of filepath strings

# TODO load character customization options from user disk
func load_customization_options():
	update_sprites()
	pass

# Just a call to update the sprites. Should be called whenever customization options are changed.
func update_sprites():
	$Skin.texture = skin_texture
	$Hat.texture = hat_texture
	$"Facial Hair".texture = facialhair_texture
	$Shirt.texture = shirt_texture
