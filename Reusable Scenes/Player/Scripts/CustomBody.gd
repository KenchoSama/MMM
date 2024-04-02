extends Node2D

# Made by victor, script for character customization, don't change.
# 
# Texture variables given in drawing order
var face_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Face/DefaultFace.png")
var hat_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Hats/DefaultHat.png")
var facialhair_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Facial Hair/DefaultBeard.png")
var hand_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Hand/DefaultHand.png")
var shirt_texture: Texture2D = preload("res://Reusable Scenes/Player/Sprites/Shirts/DefaultRobe.png")

# Character customization options will be an array of filepath strings

# TODO load character customization options from user disk
func load_customization_options():
	pass

# Just a call to update the sprites. Should be called whenever customization options are changed.
func update_sprites():
	$Face.texture = face_texture
	$Hat.texture = hat_texture
	$"Facial Hair".texture = facialhair_texture
	$Hand.texture = hand_texture
	$Shirt.texture = shirt_texture
