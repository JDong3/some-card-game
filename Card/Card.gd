extends Node2D
class_name Card

"""
two stages of card play, select -> play
"""

var config

func _init(config_in):
	"""
	config:
		sprite: a CardSprite of the card
		targets: hostile/friendly/board
	"""
	var config = config_in

func combobulate():
	pass

func select():
	print('implement in parent', self)
	# highlight card
	# show targets

func play(target):
	print('implement this function ', self)