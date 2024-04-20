extends Node2D

var hour = 0
var day = 0
var paused = false
@onready var pauseMenu = $Camera2D/Pause_Menu
var currentNPCs : int
@export var npcCap = 2
var npc = preload("res://Scenes/npc/npc.tscn")

@onready var paths = {
	$"Npc Targets/Path1/PathFollow2D" : false,
	$"Npc Targets/Path2/PathFollow2D" : false,
	$"Npc Targets/Path3/PathFollow2D" : false,
	$"Npc Targets/Path4/PathFollow2D" : false,
	$"Npc Targets/Path5/PathFollow2D" : false,
	$"Npc Targets/Path6/PathFollow2D" : false,
	$"Npc Targets/Path7/PathFollow2D" : false,
	$"Npc Targets/Path8/PathFollow2D" : false
}

func instantiate_npc():
	for i in paths:
		if paths[i] == false:
			if currentNPCs < npcCap:
				paths[i] = true
				var newNpc = npc.instantiate()
				newNpc.global_position = i.global_position
				newNpc.path = i
				$Npcs.add_child(newNpc)
				currentNPCs += 1
				print(currentNPCs)
			return

func _process(delta):
	$CanvasLayer/StaticUI/Timer_UI.text = "Hour " + str(hour)
	if Input.is_action_just_pressed("Pause"):
		PauseMenu()
	$CanvasLayer/StaticUI/Money/Label.text = str($Player.money)

func _on_timer_timeout():
	hour += 1
	if hour == 24:
		hour = 0
		day += 1
	
	instantiate_npc()

func PauseMenu():
	if paused:
		pauseMenu.hide()
		Engine.time_scale = 1
	if paused == false:
		pauseMenu.show()
		Engine.time_scale = 0
		
	paused = !paused
	print(paused)

func _on_button_pressed():
	$Menu/CanvasLayer.visible = !$Menu/CanvasLayer.visible

func _on_menu_exit_pressed():
	$Menu/CanvasLayer.visible = !$Menu/CanvasLayer.visible
