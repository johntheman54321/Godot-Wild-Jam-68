extends Control

@export var pickupOffsetRange = 4
var isInteractable = false
var isPickedUp = false
var pickedUpOffset
var currentItemId : int
const itemMap = ["coal", "coalInteractable","ironOre","ironOreInteractable","ironIngot","copperOre","copperOreInteractable","copperIngot","tinOre","tinOreInteractable", "tinIngot", "bronzeIngot", "steelIngot"]
@export var player : CharacterBody2D

func _ready():
	randomize()
	pickedUpOffset = Vector2(randi_range(-pickupOffsetRange, pickupOffsetRange), randi_range(-pickupOffsetRange, pickupOffsetRange))

func _process(delta):
	$AnimatedSprite2D.play(itemMap[currentItemId])
	if isInteractable:
		$AnimatedSprite2D.play(itemMap[currentItemId + 1])
		if not isPickedUp:
			if Input.is_action_just_pressed("Interact"):
				isPickedUp = true
				print("pickedup")
				isInteractable = false
	
	if isPickedUp:
		global_position = player.get_child(2).global_position + pickedUpOffset

func _on_interactable_range_body_entered(body):
	if body == player:
		isInteractable = true
		print(isInteractable)
	


func _on_interactable_range_body_exited(body):
	if body == player:
		isInteractable = false



