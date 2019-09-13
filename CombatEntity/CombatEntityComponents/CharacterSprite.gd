extends AnimatedSprite
class_name CharacterSprite

"""
AnimatedSprite object that workes with CharacterFrames to auto load the
animations given a path to the folder containing the animations
"""

var path

func _init(path_):
	"""
	path to the folder containing the animations
	"""
	path = path_
	frames = CharacterFrames.new(path)