extends Node2D
class_name HpBar

var max_hp
var hp # current hp
var label

func init(max_hp_):
	max_hp = max_hp_

	label = Label.new()
	label.text = 'hp: %s/%s' % [max_hp, max_hp]
	position = Vector2(-20, -25)
	add_child(label)

	return self

func change_hp(n):
	hp += n
	label.taxt = 'hp: %s/%s' % [hp, max_hp]
