extends CombatEntity
class_name EdudEntity

var fight_club

func _init(props_):
	"""
	props_:
		transaction_interface: TransactionInterface
	"""
	fight_club = Global.FIGHT_CLUB
	props = props_

	props['hp_bar'] = HpBar.new(100)
	props['character_sprite'] = CharacterSprite.new('res://assets/character/edud/')
	props['transaction_interface'] = Global.TRANSACTION_INTERFACE

	.init(props)

func act():
	send_transaction({'damage': 4}, fight_club.friendlies.props.cells[0])