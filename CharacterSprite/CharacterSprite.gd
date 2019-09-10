extends AnimatedSprite
class_name CharacterSprite

var props

func init(props_):
	"""
	props_:
		frames: SpriteFrames
	"""

	props = props_

	frames = props.frames
	play('idle')
