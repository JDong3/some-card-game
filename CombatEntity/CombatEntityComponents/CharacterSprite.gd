extends AnimatedSprite
class_name CharacterSprite

var path

func init(path_):
	path = path_
	frames = CharacterFrames.new()
	frames.init(path)

	return self