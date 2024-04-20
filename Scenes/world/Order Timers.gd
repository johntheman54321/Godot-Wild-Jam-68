extends VBoxContainer

var itemTimer = preload("res://Scenes/item_timer/item_timer.tscn")

func _on_shop_keeper_new_order(Quantity, Type):
	var newTimer = itemTimer.instantiate()
	print(typeof(newTimer))
	#add_child(itemTimer)
