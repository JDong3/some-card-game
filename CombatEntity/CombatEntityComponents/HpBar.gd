extends Node2D
class_name HpBar

"""
object that shows how much HP a CombatEntity has, used as a component of
CombatEntity
"""

var max_hp
var hp # current hp
var label

func _init(max_hp_):
	"""
	:param max_hp_: int, the max hp of a combat entity
	:return: null
	"""
	max_hp = max_hp_
	hp = max_hp

	label = Label.new()
	label.text = 'hp: %s/%s' % [max_hp, max_hp]
	position = Vector2(-20, -25) # note: hard code?
	add_child(label)

	return self

func change_hp(n):
	"""
	:param n: int, changes the HP by n
	"""
	hp += n
	label.text = 'hp: %s/%s' % [hp, max_hp]
