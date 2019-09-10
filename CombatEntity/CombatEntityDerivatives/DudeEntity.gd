extends CombatEntity
class_name DudeEntity

func _init(props_):
	"""
		props_:
			transaction_interface: TransactionInterface, # not yet,
	"""
	props = props_

	props['character_sprite'] = DudeCharacterSprite.new()
	props['hp'] = 100

	add_child(props['character_sprite'])
	props['character_sprite'].play('idle')

