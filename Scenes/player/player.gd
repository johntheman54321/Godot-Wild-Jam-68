extends CharacterBody2D

@export var speed = 100
var dir
@export var money = 50
var slotsAvailble = {
	"Slot1" : false,
	"Slot2" : false,
	"Slot3" : false,
	"Slot4" : false,
	"Slot5" : false,
	"Slot6" : false,
	"Slot7" : false,
	"Slot8" : false,
	"Slot9" : false,
}

func _ready():
	print(slotsAvailble)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized() * speed * delta
	position += dir
	
	if dir[0] != 0:
		$AnimatedSprite2D.flip_h = false if dir[0] > 0 else true
	
	move_and_slide()

func _process(delta):
	pass
