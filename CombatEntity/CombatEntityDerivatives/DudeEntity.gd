extends CombatEntity
class_name DudeEntity

func _init(props_):
	"""
		props_:
			transaction_interface: TransactionInterface, # not yet,
	"""
	props = props_

	props['character_sprite'] = CharacterSprite.new().init('res://assets/character/dude/')

	add_child(props['character_sprite'])
	props['character_sprite'].play('idle')

	props['hp_bar'] = HpBar.new().init(100)
	add_child(props['hp_bar'])