extends Cell
class_name Card

var fight_club
var transaction

func init(props_):
	"""
	props_:
		sprite: Sprite
		SelectedSprite: Sprite
		text: String
		source+: CombatEntity

		transaction:
			# primary effects
			damage: int, how much damage the card does
			heal: int
			block: int

			# status effects
			poison: int, decrement by 1
			weakness: int, halved then floored
			vulnerability: int, halved then floored

			# modifiers
			target_random: bool, chooses from all targets randomly
			target_random_hostile: bool, chooses from all hostiles randomly
			target_random_friendly: bool, chooses from all friendlies randomly
			times: int=0, how many times to do the attack
	"""
	props = props_
	transaction = props.transaction
	fight_club = Global.FIGHT_CLUB

	.init(props)

func input(event):
	"""
	add the card transaction and source to the transaction_interface
	:return: null
	"""
	.input(event)

	if event.is_action_released('cursor_select'):
		fight_club.transaction_interface.add_card(self) # probably need to fix this hack
		fight_club.transaction_interface.add_source(props.source)