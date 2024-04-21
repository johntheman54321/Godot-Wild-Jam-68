extends StaticBody2D

@export var player:CharacterBody2D
var isCooking = false
var isPlayerInRange = false

var ItemSlotA_available = true
var ItemSlotB_available = true

const itemMap = ["coal","ironOre","copperOre","tinOre", "coalInteractable","ironOreInteractable","ironIngot","copperOreInteractable","copperIngot","tinOreInteractable", "tinIngot", "bronzeIngot", "steelIngot"]

var ItemSlotA
var ItemSlotB

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("Interact") and isPlayerInRange:
		# Check if one of the items is coal and the other one is something else
		if ItemSlotA != null and ItemSlotB != null:
			if ItemSlotA.currentItemId == itemMap.find("coal") or ItemSlotB.currentItemId == itemMap.find("coal"):
				if ItemSlotA.currentItemId != itemMap.find("coal") or ItemSlotB.currentItemId != itemMap.find("coal"):
					isCooking = true
					$AnimatedSprite2D.play("1-lit")
					if isCooking == true:
						$Cooking_SFX/AudioStreamPlayer2D.play()
				else: clear_all_items()
			else: clear_all_items()

func clear_all_items():
	ItemSlotA.get_parent().remove_child(ItemSlotA)
	ItemSlotB.get_parent().remove_child(ItemSlotB)
	player.get_parent().add_child(ItemSlotA)
	player.get_parent().add_child(ItemSlotB)
	ItemSlotA.global_position = global_position - Vector2(randi_range(-2, 2), 1)
	ItemSlotB.global_position = global_position - Vector2(randi_range(-2, 2), 1)

# Adds an Item to one of the available ItemSlots
func add_item(item):
	item.get_parent().remove_child(item)
	if ItemSlotA_available:
		$ItemSlotA.add_child(item)
		ItemSlotA = item
	elif ItemSlotB_available:
		$ItemSlotB.add_child(item)
		ItemSlotB = item
	else:
		return

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
