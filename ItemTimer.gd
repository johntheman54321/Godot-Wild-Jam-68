extends Control

@export var icons:Array[Texture2D]
const itemMap = ["coal","iron","copper","tin"]
var pickableItem = preload("res://Scenes/PickableItem/pickable_item.tscn")
@export var player : CharacterBody2D
@export var quantity:int
@export var type:String
@onready var current_ore = itemMap.find(type)

func _ready():
	# Change this to a better function later
	$Timer.wait_time = quantity
	$Timer.start()
	$TextureRect.texture = icons[itemMap.find(type)]

func _process(delta):
	$ProgressBar.value = (($Timer.wait_time - $Timer.time_left) * 100)/$Timer.wait_time
	

	
func _on_button_pressed():
	if $ProgressBar.value == 100:
		queue_free()
	var newPickableItem = pickableItem.instantiate()
	newPickableItem.currentItemId = current_ore
	newPickableItem.global_position = player.global_position + Vector2(-40, -40)
	newPickableItem.player = player
	$"../../../".add_child(newPickableItem)
	
