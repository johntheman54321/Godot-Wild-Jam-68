extends Control

@onready var World = $"../../"

func _on_resume_pressed():
	World.PauseMenu()


func _on_quit_pressed():
	get_tree().quit()
