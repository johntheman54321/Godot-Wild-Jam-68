extends Node2D

@export var player:CharacterBody2D
@export var pickupOffsetRange = 2
var isInteractable = false
var isPickedUp = false
var pickedUpOffset

func _ready():
	randomize()
	pickedUpOffset = Vector2(randi_range(-pickupOffsetRange, pickupOffsetRange), randi_range(-pickupOffsetRange, pickupOffsetRange))

func _process(delta):
	if isInteractable:
		$AnimatedSprite2D.play("coal-interactable")
		if not isPickedUp:
			if Input.is_action_just_pressed("Interact"):
				isPickedUp = true
				print("pickedup")
				isInteractable = false
	else:
		$AnimatedSprite2D.play("coal")
	
	if isPickedUp:
		global_position = player.get_child(2).global_position + pickedUpOffset
	
func _on_interactable_range_body_entered(body):
	if body == player:
		isInteractable = true


func _on_interactable_range_body_exited(body):
	if body == player:
		isInteractable = false
