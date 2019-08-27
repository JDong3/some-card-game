extends Sprite
class_name CardSprite

func _init(path):
	texture = load(path)
	set_centered(false)
	set_offset(Vector2(0, - texture.get_size().y))
