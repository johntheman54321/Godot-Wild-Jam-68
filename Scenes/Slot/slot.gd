extends PanelContainer

@onready var textureRect = $AnimatedSprite2D

func _get_drag_data(at_position):
	return textureRect

func _can_drop_data(at_position, data):
	return data is AnimatedSprite2D

func _drop_data(at_position, data):
	var temp = textureRect.animation
	textureRect.animation = data.animation
	data.animation = temp
