extends Sprite
class_name PathSprite

"""
literally just an alternate constructor for Sprite
"""

var path

func _init(path_):
	path = path_
	texture = load(path)