extends Node
class_name CombatInterface

var combat_manager
var uid

# dot
var poison
var bleed

# atk mods (when sending damage)
var weak

# def mods (when receiving damage)
var vulnerable
var evasion

# block mods
var frail

func _init(combat_manager_, uid_):
	"""
	constructor for CombatInterface, should only be used by a CombatManager
	"""
	combat_manager = combat_manager_
	uid = uid_

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
	if transaction.has('poison'):
		poison += transaction['poison']
	pass

func process_damage(damage):
	pass

func process_dot():
	pass