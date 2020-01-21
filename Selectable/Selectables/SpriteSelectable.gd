extends Selectable
class_name SpriteSelectable

var path
var sprite

func _init(path_):
	path = path_
	sprite = PathSprite.new(path)

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