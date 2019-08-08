extends Node

var path
var scene
var inst
var isAttached
var sceneTree

func _init(pathToScene, attachedSceneTree):
	"""
	:param path: string path to the scene you want to manage
	"""
	path = pathToScene
	scene = load(path)
	inst = scene.instance()
	isAttached = false
	sceneTree = attachedSceneTree
	print(attachedSceneTree)

func toggle():
	
	if !isAttached:
		sceneTree.root.add_child(inst)
		isAttached = !isAttached
	else:
		sceneTree.root.remove_child(inst)
		isAttached = !isAttached