extends Control

var ammount = {
	"coal" : 0,
	"iron" : 0,
	"cooper" : 0,
	"tin" : 0
}

var onGoingOrder = {
	"coal" : false,
	"iron" : false,
	"cooper" : false,
	"tin" : false
}

func _process(delta):
	$CanvasLayer/Timers/Coal/Ammount.text = str(ammount["coal"])
	


func _on_shop_keeper_new_order(Quantity, Type):
	if Type == "coal":
		ammount["coal"] += Quantity
		print(ammount["coal"])
