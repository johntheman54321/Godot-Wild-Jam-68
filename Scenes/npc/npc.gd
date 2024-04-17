extends Node2D

var progress = 0
@export var path:PathFollow2D
@export var speed = 1

var animations = [
	"npc1",
	"npc2"
]

func _ready():
	randomize()
	$AnimatedSprite2D.play(animations.pick_random())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if progress >= 1.0:
		path.progress_ratio = 1
	else:
		progress += speed * delta
		path.progress_ratio = progress
	global_position = path.global_position
