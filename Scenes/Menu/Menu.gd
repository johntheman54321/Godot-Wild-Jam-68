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

func _ready():
	$CanvasLayer.hide()

func _process(delta):
	#coal
	$CanvasLayer/Timers/Coal/Ammount.text = "x" + str(ammount["coal"])
	if $CanvasLayer/Timers/Coal/CoalTimer.time_left > 0:
		$CanvasLayer/Timers/Coal/Time.text = str(int($CanvasLayer/Timers/Coal/CoalTimer.time_left)) + " Hours..."
	if ammount["coal"] > 0:
		$CanvasLayer/Timers/Coal.show()
	else:
		$CanvasLayer/Timers/Coal.hide()
	


func _on_shop_keeper_new_order(Quantity, Type):
	if Type == "coal":
		if onGoingOrder["coal"] == false:
			ammount["coal"] += Quantity
			$CanvasLayer/Timers/Coal/CoalTimer.start()
			print(ammount["coal"])
			onGoingOrder["coal"] = true
		else:
			ammount["coal"] += Quantity
