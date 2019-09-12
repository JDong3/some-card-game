extends TileMap

func _ready():
	add_child(Global.GAME_FOCUS_MANAGER)
	var c_hub = CursorHub.new()

	var friendly = FriendlyArea.new({
		'cursor_hub': c_hub
	})

	friendly.set_position(Vector2(80, 140))
	add_child(friendly)

	var hostile = HostileArea.new({
		'cursor_hub': c_hub
	})
	hostile.set_position(Vector2(300, 140))
	add_child(hostile)

	# load hand
	var hand = Hand.new({
		'cells': [TestCardCell.new({'source': friendly['props']['cells'][0]}),
				  TestCardCell.new({'source': friendly['props']['cells'][0]})],
		'cursor_hub': c_hub
	})
	hand.set_position(Vector2(120, 270))
	hand.obtain_sole_focus()
	add_child(hand)