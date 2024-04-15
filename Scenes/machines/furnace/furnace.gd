extends StaticBody2D

@export var player:CharacterBody2D
var playerIsClose = false
var isCooking = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		$Tooltip.hide()
		isCooking = true
		$AnimatedSprite2D.play("1-lit")

func _on_area_2d_body_entered(body):
	if body == player and not isCooking:
		$Tooltip.show()

func _on_area_2d_body_exited(body):
	if body == player:
		$Tooltip.hide()
		
