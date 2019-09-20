extends Node2D

var props = {}

func init(props_):
	"""
	props_:
		transaction: Dictionary
		...
	"""
	props = props_

func playable_card(source):
	props.source = source
	return PlayableCard.new(props)