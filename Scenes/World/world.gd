extends Node2D

var hour = 0
var day = 0
var paused = false
@onready var pauseMenu = $Camera2D/Pause_Menu

func _process(delta):
	$CanvasLayer/Timer_UI.text = "Hour " + str(hour)
	if Input.is_action_just_pressed("Pause"):
		PauseMenu()

func _on_timer_timeout():
	hour += 1
	if hour == 24:
		hour = 0
		day += 1

func PauseMenu():
	if paused:
		pauseMenu.hide()
		Engine.time_scale = 1
	if paused == false:
		pauseMenu.show()
		Engine.time_scale = 0
		
	paused = !paused
	print(paused)
	
