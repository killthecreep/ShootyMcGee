extends Node2D


func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("player"):
		print("Bomb Touched")
		queue_free()
