extends AnimatedSprite
class_name CharacterSprite

var props

func init(props_):
	"""
	props_:
		sprite_frames: SpriteFrames
	"""

	props = props_

	set_sprite_frames(props.sprite_frames)