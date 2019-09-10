extends Selectable
class_name CombatEntity

"""
parent class for friends and enemies
"""

var props

# var combat_manager
# var uid

# dot
# var poison
# var bleed

# atk mods (when sending damage)
# var weak

# def mods (when receiving damage)
# var vulnerable
# var evasion

# block mods
# var frail
func init(props_):
	"""
	props_:
		name: Str, display name of the CombatEntity
		hp: int
		animated_sprite
	"""
	props = props_
	# combat_manager = combat_manager_
	# uid = uid_

func send_transaction(transaction, target):
	"""
	sends a transaction to a target CombatInterface
	:param transaction: Dictionary, a Dictionary describing the transaction
	transaction:
		poison?:
		weaken?:
		.
		.
		.
	:param target: CombatInterface, the CombatInterface of the target you are sending
	the transaction to
	"""
	target.process_transaction(transaction)

func process_transaction(transaction):
	"""
	processes a transaction sent by another CombatInterface
	processes damage first, then effects
	:param transaction: Dictionary, a Dictionary describing the transaction
	transaction:
		poison?:
		weaken?:
		.
		.
		.
	"""
	if transaction.has('damage'):
		process_damage(transaction['damage'])
	#if transaction.has('poison'):
	#	poison += transaction['poison']
	#pass

func process_damage(damage):
	pass

func process_dot():
	pass

func input(event):
	pass