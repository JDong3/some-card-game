extends AnimatedSprite
class_name CharacterSprite

"""
AnimatedSprite object that workes with CharacterFrames to auto load the
animations given a path to the folder containing the animations
"""

var props

func _init(_props):
	"""
	path to the folder containing the animations

	_props:
		path: String, string path to the folder with the animations
		offset: Vector2, offset vector for the collision area (offset to the
				feet of the character)
		flip_h=false: bool
	"""
	props = _props
	frames = CharacterFrames.new(props.path)
	offset = props.offset
	if props.has('flip_h'):
		flip_h = props.flip_h

	connect('animation_finished', self, 'on_animation_finished')

func on_animation_finished():
	play('idle')
