extends Node2D

@export var player : CharacterBody2D

func _ready():
	pass


func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body == player:
		$AnimatedSprite2D.play("Interactable")


func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("Non-Interactable")
