extends CombatEntity
class_name EdudEntity

func _init(props_):
	"""
	props_:
		transaction_interface: TransactionInterface
	"""
	props = props_

	props['hp_bar'] = HpBar.new(100)
	props['character_sprite'] = CharacterSprite.new('res://assets/character/edud/')
	props['transaction_interface'] = Global.TRANSACTION_INTERFACE

	.init(props)

func input(event):
	if event.is_action_released('cursor_select'):
		props['transaction_interface'].add_target(self)
