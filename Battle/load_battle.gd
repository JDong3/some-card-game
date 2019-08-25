extends TileMap

func _ready():
	# load hand
	var hand = Hand.new()
	hand.set_position(Vector2(120, 270))
	add_child(hand)
	return