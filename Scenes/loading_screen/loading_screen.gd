extends AnimationPlayer

@export var animation_type:String

func _ready():
	if animation_type == "in":
		$".".play("Fade in")
	if animation_type == "out":
		$".".play("Fade out")
		
	
