extends SpriteFrames
class_name CharacterFrames

"""
SpriteFrames object which also autoloads animations when given the correct
path to a folder of animations for a CombatEntity
"""

var path

func _init(path_):
	"""
	path_: path to animation folder
	"""
	path = path_
	load_animations()

func load_animations():
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true, true)

	var item_name

	while true:
		item_name = dir.get_next()

		if item_name == '':
			break
		elif item_name.ends_with('.png'):
			print(item_name)
		else:
			continue


func process_animation(dir_name):
	"""
	add animation to SpriteFrames, assuming the files are named ___1, ___2, etc
	:param dir_name: String
	"""

	var new_path = '%s/%s' % [path, dir_name]
	var dir = Directory.new()
	var file_name
	var file_path

	# add the animation to SpriteFrames
	add_animation(dir_name)
	set_animation_speed(dir_name, 10)

	if dir_name.casecmp_to('idle') == 0:
		set_animation_loop(dir_name, true)
	else:
		set_animation_loop(dir_name, false)

	dir.open(new_path)
	dir.list_dir_begin(true, true)

	# load the images into the animation
	while true:
		file_name = dir.get_next()
		file_path = '%s/%s' % [new_path, file_name]

		# exit on end of dir
		if file_name.casecmp_to('') == 0:
			break

		# if its not an image file skip it
		if !file_name.ends_with('.png'):
			continue

		add_frame(dir_name, load(file_path))

