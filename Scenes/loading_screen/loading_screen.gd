extends Node2D

#"in" for fade in and "out" for fade out
@export var animation_type:String

func _ready():
	if animation_type == "in":
		$AnimationPlayer.play("Fade in")
	if animation_type == "out":
		$AnimationPlayer.play("Fade out")
		
	
