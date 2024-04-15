extends Node2D

@onready var Song1 = $"Medieval Song Village Consort"
@onready var Song2 = $"Royalty Free Medieval Music - _Celebration"
@onready var Song3 = $"Dungeons and Dragons"

func _ready():
	randi_range(1,3)
	
