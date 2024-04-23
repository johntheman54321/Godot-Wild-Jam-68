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
var currentAnimation
var isInInventory = false

func _ready():
	randomize()
	pickedUpOffset = Vector2(randi_range(-pickupOffsetRange, pickupOffsetRange), randi_range(-pickupOffsetRange/2, pickupOffsetRange/2))
	currentAnimation = $AnimatedSprite2D.animation
	$".".tooltip_text = itemMap[currentItemId]
func _process(delta):
	$AnimatedSprite2D.play(itemMap[currentItemId])
	if isInteractable:
		$AnimatedSprite2D.play(itemMap[currentItemId] + "Interactable")
		if not isPickedUp:
			if Input.is_action_just_pressed("Pickup"):
				isPickedUp = true
				isInteractable = false
				spawmInv()
		
	if Input.is_action_just_pressed("Drop") and isPickedUp:
		isPickedUp = false
		global_position = player.global_position + pickedUpOffset * 2

func _on_interactable_range_body_entered(body):
	if !isInInventory:
		if body == player:
			isInteractable = true

func _on_interactable_range_body_exited(body):
	if !isInInventory:
		if body == player:
			isInteractable = false

func spawmInv():
	for i in player.slotsAvailble:
		print(i)
		if player.slotsAvailble[i] == false:
			print("in inv")
			reparent(i)
			player.slotsAvailble[i] = true
			i.tooltip_text = itemMap[currentItemId]
			isInInventory = true
			return
