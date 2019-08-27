extends Sprite
class_name CellSprite

"""
sprite thats not centered and with a better constructor
"""

func _init(path_in):
	set_texture(load(path_in))
	set_centered(false)

