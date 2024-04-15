extends StaticBody2D

@export var player:CharacterBody2D
var isCooking = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		$Tooltip.hide()
		isCooking = true
		$AnimatedSprite2D.play("1-lit")
		if isCooking == true:
			$Cooking_SFX/AudioStreamPlayer2D.play()

func _on_area_2d_body_entered(body):
	if body == player and not isCooking:
		$Tooltip.show()

func _on_area_2d_body_exited(body):
	if body == player:
		$Tooltip.hide()
		


func _on_cooking_sfx_body_entered(body):
	if body == player and isCooking:
		$Cooking_SFX/AudioStreamPlayer2D.play()


func _on_cooking_sfx_body_exited(body):
	if body == player and isCooking:
		$Cooking_SFX/AudioStreamPlayer2D.stop()
