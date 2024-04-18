extends StaticBody2D

@export var player : CharacterBody2D
var Quantity = 0

func _process(delta):
	$OrderMenu/Label.text = str(Quantity)

func _on_area_2d_body_entered(body):
	if body == player:
		$AnimatedSprite2D.play("Interactable")
		$OrderMenu.show()

func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("Non-Interactable")
	$OrderMenu.hide()
	Quantity = 0

#Quantity
func _on_more_pressed():
	if MOUSE_BUTTON_LEFT:
		if Quantity < 100:
			Quantity += 1
		print("left")

func _on_less_pressed():
	if Quantity > 0:
		Quantity -= 1
