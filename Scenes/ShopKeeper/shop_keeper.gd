extends StaticBody2D

@export var player : CharacterBody2D
var quantity = 0

func _process(delta):
	$OrderMenu/Label.text = str(quantity)

func _on_area_2d_body_entered(body):
	if body == player:
		$AnimatedSprite2D.play("Interactable")
		$OrderMenu.show()

func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("Non-Interactable")
	$OrderMenu.hide()
	quantity = 0

#Quantity
func _on_more_pressed():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
				if quantity < 100:
					quantity += 1
					print("left")
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) == true:
				if quantity < 91:
					quantity += 10
					print("right")
	

func _on_less_pressed():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
		if quantity > 0:
			quantity -= 1
			print("left")
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) == true:
		if quantity > 9:
			quantity -= 10
			print("right")
	


