extends Sprite
class_name PathSprite

"""
literally just an alternate constructor for Sprite mainly for ease of loading a
texture
"""

var path

func _init(path_):
	path = path_
	texture = load(path)