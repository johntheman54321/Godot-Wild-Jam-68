extends StaticBody2D

@export var player:CharacterBody2D
var playerIsClose = false
var isCooking = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		$Tooltip.hide()
		print("pressed")

func _on_area_2d_body_entered(body):
	if body == player:
		$Tooltip.show()
		print("in of furnace")

func _on_area_2d_body_exited(body):
	if body == player:
		$Tooltip.hide()
		print("out of furnace")
		
