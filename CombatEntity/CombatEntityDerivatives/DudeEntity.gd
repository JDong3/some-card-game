extends CombatEntity
class_name DudeEntity

func _init(props_):
	"""
		props_:
			transaction_interface: TransactionInterface, # not yet,
	"""
	props = props_

	props['character_sprite'] = CharacterSprite.new('res://assets/character/dude/')
	props['hp_bar'] = HpBar.new(100)

	.init(props)