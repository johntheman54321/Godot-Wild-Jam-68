extends Control

@export var icons:Array[Texture2D]
const itemMap = ["coal","iron","copper","tin"]

@export var quantity:int
@export var type:String

func _ready():
	$TextureRect.texture = icons[itemMap.find(type)]
	
	# Change this to a better function later
	$Timer.wait_time = quantity
	$Timer.start()

func _process(delta):
	$ProgressBar.value = (($Timer.wait_time - $Timer.time_left) * 100)/$Timer.wait_time
