extends Node2D
class_name Card

"""
two stages of card play, select -> play
"""

var props

func _init(props_):
	"""
	config:
		sprite: a CardSprite of the card
		targets: hostile/friendly/board
	"""
	props = props_
	combobulate()

func combobulate():
	add_child(props.sprite)
	return

func select():
	print('implement in parent', self)
	# highlight card
	# show targets

func play(target):
	print('implement this function ', self)

func input(event):
	print('implement this function', self)