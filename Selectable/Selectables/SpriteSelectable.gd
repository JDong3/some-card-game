extends Selectable
class_name SpriteSelectable

var path
var sprite
var props

func _init(props_):
	"""
	props: Sprite
	"""
	props = props_

	sprite = props.sprite

func render():
	pass

func select():
	.select()
	render()

func deselect():
	.deselect()
	render()

func get_class():
	return 'SpriteSelectable'
