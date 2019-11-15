extends AnimatedSprite
class_name CharacterSprite

"""
AnimatedSprite object that workes with CharacterFrames to auto load the
animations given a path to the folder containing the animations
"""

var props

func _init(props_):
	"""
	path to the folder containing the animations

	props_:
		path: String, string path to the folder with the animations
		offset: Vector2, offset vector for the collision area (offset to the
		        feet of the character)
	"""
	props = props_
	frames = CharacterFrames.new(props.path)
	offset = props.offset