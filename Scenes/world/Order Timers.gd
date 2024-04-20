extends VBoxContainer

var itemTimer = preload("res://Scenes/item_timer/item_timer.tscn")

func _on_shop_keeper_new_order(quantity, type):
	var newTimer = itemTimer.instantiate()
	newTimer.quantity = quantity
	newTimer.type = type
	newTimer.player = $"../../Player"
	add_child(newTimer)
