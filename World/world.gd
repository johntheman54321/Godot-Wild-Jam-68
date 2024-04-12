extends Node2D

var hour = 0
var day = 0

func _process(delta):
	$Timer_UI.text = "Hour " + str(hour)

func _on_timer_timeout():
	hour += 1
	if hour == 24:
		hour = 0
		day += 1
