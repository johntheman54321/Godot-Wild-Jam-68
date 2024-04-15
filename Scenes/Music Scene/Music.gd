extends Node2D

@onready var Song1 = $"Medieval Song Village Consort"
@onready var Song2 = $"Royalty Free Medieval Music - _Celebration"
@onready var Song3 = $"Dungeons and Dragons"
@onready var ArrayOfSongs:Array[AudioStreamPlayer]
var current_song:int

func _ready():
	ArrayOfSongs = [Song1, Song2, Song3]
	randomize()
	ArrayOfSongs.shuffle()
	current_song = 0
	ArrayOfSongs[current_song].play()
	print(current_song)
	


func _on_medieval_song_village_consort_finished():
	current_song += 1
	if current_song == 3:
		current_song = 0
	ArrayOfSongs[current_song].play()
