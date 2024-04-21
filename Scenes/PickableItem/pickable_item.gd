extends Control

@export var pickupOffsetRange = 4
@export var spawnOffsetRange = 4
var isInteractable = false
var isPickedUp = false
var draggable = false
var pickedUpOffset
@export var currentItemId : int
const itemMap = ["coal","ironOre","copperOre","tinOre", "coalInteractable","ironOreInteractable","ironIngot","copperOreInteractable","copperIngot","tinOreInteractable", "tinIngot", "bronzeIngot", "steelIngot"]
@export var player : CharacterBody2D

func _ready():
	randomize()
	pickedUpOffset = Vector2(randi_range(-pickupOffsetRange, pickupOffsetRange), randi_range(-pickupOffsetRange/2, pickupOffsetRange/2))
func _process(delta):
	$AnimatedSprite2D.play(itemMap[currentItemId])
	if isInteractable:
		$AnimatedSprite2D.play(itemMap[currentItemId] + "Interactable")
		if not isPickedUp:
			if Input.is_action_just_pressed("Pickup"):
				isPickedUp = true
				isInteractable = false
				get_parent().remove_child(self)
				player.get_child(2).add_child(self)
	if Input.is_action_just_pressed("Drop") and isPickedUp:
		isPickedUp = false
		get_parent().remove_child(self)
		player.get_parent().add_child(self)
		global_position = player.global_position + pickedUpOffset * 2

func _on_interactable_range_body_entered(body):
	if body == player:
		isInteractable = true

func _on_interactable_range_body_exited(body):
	if body == player:
		isInteractable = false
