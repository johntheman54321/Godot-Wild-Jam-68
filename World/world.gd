extends Node2D

var time = 0

func _process(delta):
	$Timer_UI.text = str(time)



func _on_timer_timeout():
	time += 1
	
