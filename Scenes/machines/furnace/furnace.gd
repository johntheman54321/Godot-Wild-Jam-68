extends StaticBody2D

@export var player:CharacterBody2D
var isCooking = false
var isPlayerInRange = false

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interact") and isPlayerInRange:
		$Tooltip.hide()
		isCooking = true
		$AnimatedSprite2D.play("1-lit")
		if isCooking == true:
			$Cooking_SFX/AudioStreamPlayer2D.play()
		

func _on_area_2d_body_entered(body):
	if body == player and not isCooking:
		$Tooltip.show()
		isPlayerInRange = true

func _on_area_2d_body_exited(body):
	if body == player:
		$Tooltip.hide()
		isPlayerInRange = false

func _on_cooking_sfx_body_entered(body):
	if body == player and isCooking:
		$Cooking_SFX/AudioStreamPlayer2D.play()

func _on_cooking_sfx_body_exited(body):
	if body == player and isCooking:
		$Cooking_SFX/AudioStreamPlayer2D.stop()
