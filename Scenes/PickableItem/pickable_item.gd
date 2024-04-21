extends Control

@export var pickupOffsetRange = 4
@export var spawnOffsetRange = 4
var isInteractable = false
var isPickedUp = false
var pickedUpOffset
var currentItemId : int
const itemMap = ["coal","ironOre","copperOre","tinOre", "coalInteractable","ironOreInteractable","ironIngot","copperOreInteractable","copperIngot","tinOreInteractable", "tinIngot", "bronzeIngot", "steelIngot"]
@export var player : CharacterBody2D
var quantity : int

func _ready():
	randomize()
	pickedUpOffset = Vector2(randi_range(-pickupOffsetRange, pickupOffsetRange), randi_range(-pickupOffsetRange, pickupOffsetRange))
	$".".global_position =   $"../Marker2D".global_position + Vector2(randi_range(-spawnOffsetRange, spawnOffsetRange), randi_range(-spawnOffsetRange, spawnOffsetRange))
func _process(delta):
	$Quantity.text = str(quantity)
	$AnimatedSprite2D.play(itemMap[currentItemId])
	if isInteractable:
		$AnimatedSprite2D.play(itemMap[currentItemId] + "Interactable")
		if not isPickedUp:
			if Input.is_action_just_pressed("Pickup"):
				isPickedUp = true
				print("pickedup")
				isInteractable = false
	if Input.is_action_just_pressed("Drop"):
		isPickedUp = false
	print(isInteractable)
	
	if isPickedUp:
		global_position = player.get_child(2).global_position + pickedUpOffset
	else:
		global_position = player.global_position

func _on_interactable_range_body_entered(body):
	if body == player:
		isInteractable = true
		print(isInteractable)
	


func _on_interactable_range_body_exited(body):
	if body == player:
		isInteractable = false



