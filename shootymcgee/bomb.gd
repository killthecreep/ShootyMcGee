extends Node2D

@onready var score_manager = get_node("/root/ScoreManager")

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("player"):
		print("Bomb Touched")
		queue_free()
		score_manager.add_bomb(1)
		
