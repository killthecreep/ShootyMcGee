extends CharacterBody2D
class_name Goblin

@export var hp: int = 3
var is_attacking: bool = false

func _physics_process(delta):
	move_and_slide()
	
	if is_attacking:
		$AnimationPlayer.play("Attack Right")
	elif velocity.length() > 0:
		$AnimationPlayer.play("Running")
	else:
		$AnimationPlayer.play("Idle")


	if velocity.x > 0:
		$CharacterSprite.flip_h = false
	else:
		$CharacterSprite.flip_h = true

func hit(damage_number: int):
	hp -= damage_number
	$AnimationPlayer.play("Hit")
	print("Goblin hit")
	if hp <= 0:
		ScoreManager.add_score(100)
		queue_free()


func _on_detection_range_area_entered(body):
	if body.is_in_group("player"):
		is_attacking = true
		print("Play attack animation")
		$AnimationPlayer.play("Attack Right")


func _on_detection_range_area_exited(body):
	if body.is_in_group("player"):
		is_attacking = false
		print("idle")
