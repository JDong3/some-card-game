extends Node2D
class_name Card

var props = {}

func init(props_):
	"""
	props_:
		sprite: Sprite
		SelectedSprite: Sprite
		text: String
		transaction: Dictionary
		...
	"""
	props = props_

func playable_card(source):
	props.source = source
	return PlayableCard.new(props)