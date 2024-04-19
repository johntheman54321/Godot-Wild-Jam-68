extends Node2D

@export var player:CharacterBody2D
var isInteractable = false
var isPickedUp = false

func _ready():
	pass

func _process(delta):
	if isInteractable == true:
		$AnimatedSprite2D.play("coal-interactable")
		if isPickedUp == false:
			if Input.is_action_just_pressed("Interact"):
				isPickedUp = true
				print("pickedup")
				isInteractable = false
	if isInteractable == false:
		$AnimatedSprite2D.play("coal")

func _on_interactable_range_body_entered(body):
	if body == player:
		isInteractable = true


func _on_interactable_range_body_exited(body):
	if body == player:
		isInteractable = false
