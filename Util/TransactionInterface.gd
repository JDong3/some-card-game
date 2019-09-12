extends Node
class_name TransactionInterface

var source # combat entity
var transaction # transaction dictionary
var target # combat entity

func _init():
	return

func try_process():
	print('trying process')
	if source != null and transaction != null and target != null:
		source.send_transaction(transaction, target)
		clear()

func add_source(source_):
	source = source_
	try_process()

func add_transaction(transaction_):
	transaction = transaction_
	try_process()

func add_target(target_):
	target = target_
	try_process()

func clear():
	source = null
	transaction = null
	target = null