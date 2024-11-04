extends Node2D


func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("player"):
		print("Portal Touched")
		get_tree().change_scene_to_file("res://3_rd_level.tscn")
