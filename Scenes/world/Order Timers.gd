extends VBoxContainer

var itemTimer = preload("res://Scenes/item_timer/item_timer.tscn")

func _on_shop_keeper_new_order(quantity, type):
	var newTimer = itemTimer.instantiate()
	newTimer.player = $"../../Player"
	newTimer.quantity = quantity
	newTimer.type = type
	add_child(newTimer)
