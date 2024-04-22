extends CharacterBody2D

@export var speed = 100
var dir
@export var money = 50
@onready var slotsAvailble = {
	"Slot1" : $Inventory/Slot1/AnimatedSprite2D,
	"Slot2" : $Inventory/Slot2/AnimatedSprite2D,
	"Slot3" : $Inventory/Slot3/AnimatedSprite2D,
	"Slot4" : $Inventory/Slot4/AnimatedSprite2D,
	"Slot5" : $Inventory/Slot5/AnimatedSprite2D,
	"Slot6" : $Inventory/Slot6/AnimatedSprite2D,
	"Slot7" : $Inventory/Slot7/AnimatedSprite2D,
	"Slot8" : $Inventory/Slot8/AnimatedSprite2D,
	"Slot9" : $Inventory/Slot9/AnimatedSprite2D,
}

func _ready():
	slotsAvailble["Slot1"].play("ironIngot")

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
