extends CharacterBody2D

@export var speed = 100
var dir
@export var money = 50
@export var pickableItem : Node2D
var holdingItem = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized() * speed * delta
	position += dir
	
	if dir[0] != 0:
		$AnimatedSprite2D.flip_h = false if dir[0] > 0 else true
	
	move_and_slide()

func _process(delta):
	if pickableItem.isPickedUp == true:
		pickableItem.global_position = $Marker2D.global_position
