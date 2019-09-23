extends CombatEntity
class_name DudeEntity

var fight_club

func _init(props_):
	"""
	props_:
		transaction_interface: TransactionInterface
	"""
	props = props_
	fight_club = Global.FIGHT_CLUB

	props['character_sprite'] = CharacterSprite.new('res://assets/character/dude/')
	props['hp_bar'] = HpBar.new(100)
	props['transaction_interface'] = Global.TRANSACTION_INTERFACE


	.init(props)

func prepare():
	pass

func act():
	# hand needs to draw from draw_pile
	for i in range(5):
		fight_club.hand.draw()

	fight_club.hand.obtain_sole_focus()