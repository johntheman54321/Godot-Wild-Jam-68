extends Node2D

#Make the var in for fade in and out for fade out
@export var animation_type = ""

func _ready():
	if animation_type == "in":
		$AnimationPlayer.play("Fade in")
	elif animation_type == "out":
		$AnimationPlayer.play("Fade out")

func _process(delta):
	if $AnimationPlayer.is_playing() == true:
		print("playing")
	
