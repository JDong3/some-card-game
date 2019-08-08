extends Node

func _ready():
	
	combobulate()

func makeArea():
	
	var res = Area2D.new()
	
	return res
	
func makeSprite():
	
	var res = Sprite.new()
	res.texture = load('res://assets/sprites/map-room.png')
	
	return res
	
func makeCollision():
	
	var res = CollisionShape2D.new()
	
	res.shape = RectangleShape2D.new()
	res.shape.extents = Vector2(25, 25)
	
	return res
	
func combobulate():
	
	var res = makeArea()
	var sprite = makeSprite()
	var collision = makeCollision()
	
	res.add_child(sprite)
	res.add_child(collision)
	
	self.add_child(res)