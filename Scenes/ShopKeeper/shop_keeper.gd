extends StaticBody2D

@export var player : CharacterBody2D
var quantity = 1
const quantityCap = 50
var cost = 0
var currentItemId = 0

var itemMap = [
	"coal",
	"iron",
	"copper",
	"tin"
] 

const costTable = {
	"coal" : 1,
	"iron" : 4,
	"copper" : 4,
	"tin" : 2
}

func calculateCost():
	cost = costTable[itemMap[currentItemId]] * quantity

func _process(delta):
	$OrderMenu/Amount/Count.text = str(quantity)
	$OrderMenu/OrderButton.text = "Order " + str(cost) + "$"
	if player.money < cost:
		$OrderMenu/OrderButton.disabled = true
	else: 
		$OrderMenu/OrderButton.disabled = false
	
	calculateCost()
	
func _on_area_2d_body_entered(body):
	if body == player:
		$AnimatedSprite2D.play("Interactable")
		$OrderMenu.show()

func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("Non-Interactable")
	$OrderMenu.hide()
	quantity = 1

#Quantity
func _on_more_pressed():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
				if quantity < quantityCap:
					quantity += 1
				else: quantity = 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) == true:
				if quantity < 41:
					quantity += 10
				else: quantity = 1

func _on_less_pressed():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
		if quantity > 1:
			quantity -= 1
		else:
			quantity = quantityCap
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) == true:
		if quantity > 10:
			quantity -= 10
		else:
			quantity = 50

func _on_order_button_pressed():
	player.money -= cost

