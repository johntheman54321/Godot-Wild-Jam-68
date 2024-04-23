extends PanelContainer

var child

func _ready():
	pass


func _process(delta):
	child = $".".get_child(0)
	if child != null:
		child.scale = Vector2(0.3, 0.3)
		child.position = Vector2(4, 4)
		print("helljkjk")
	
#func _get_drag_data(at_position):
#
#	var preview_texture = AnimatedSprite2D.new()
#	preview_texture.animation = $AnimatedSprite2D.get
#
#	var preview = Control.new()
#	preview.add_child(preview_texture)
#
#	set_drag_preview(preview)
#
#	return textureRect
#
#func _can_drop_data(at_position, data):
#	return data is AnimatedSprite2D
#
#func _drop_data(at_position, data):
#	var temp = textureRect.animation
#	textureRect.animation = data.animation
#	data.animation = temp
