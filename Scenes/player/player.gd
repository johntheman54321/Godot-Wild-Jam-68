extends CharacterBody2D

@export var speed = 100
var dir
@export var money = 50
@onready var slotsAvailble = {
	$Inventory/Slot1 : false,
	$Inventory/Slot2 : false,
	$Inventory/Slot3 : false,
	$Inventory/Slot4 : false,
	$Inventory/Slot5 : false,
	$Inventory/Slot6 : false,
	$Inventory/Slot7 : false,
	$Inventory/Slot8 : false,
	$Inventory/Slot9 : false,
}

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized() * speed * delta
	position += dir
	
	if dir[0] != 0:
		$AnimatedSprite2D.flip_h = false if dir[0] > 0 else true
	
	move_and_slide()

func _process(delta):
	if dir == Vector2(0,0):
		if Input.is_action_just_pressed("openInv"):
			$Inventory.visible = !$Inventory.visible
	else:
		$Inventory.hide()
