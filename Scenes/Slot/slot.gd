extends PanelContainer

@onready var textureRect = $TextureRect

func _get_drag_data(at_position):
	return textureRect

func _can_drop_data(at_position, data):
	return data is TextureRect

func _drop_data(at_position, data):
	var temp = textureRect.texture
	textureRect.texture = data.texture
	data.texture = temp
