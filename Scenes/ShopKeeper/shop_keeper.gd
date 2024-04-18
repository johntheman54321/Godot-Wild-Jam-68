extends StaticBody2D

@export var player : CharacterBody2D

func _on_area_2d_body_entered(body):
	if body == player:
		$AnimatedSprite2D.play("Interactable")
		$OrderMenu.show()

func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("Non-Interactable")
	$OrderMenu.hide()
