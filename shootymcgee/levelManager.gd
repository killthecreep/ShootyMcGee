extends Node2D

@export var bg_music : Resource



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GloabalAudioManager.play_track(bg_music, 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
