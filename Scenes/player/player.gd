extends CharacterBody2D

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed * delta
	move_and_slide()
