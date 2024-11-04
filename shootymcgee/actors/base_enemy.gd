extends CharacterBody2D
class_name Enemy

@export var hp: int = 3

func _physics_process(delta):
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimationPlayer.play("run")
	else:
		$AnimationPlayer.play("Idle")
	
	if velocity.x > 0:
		$CharacterSprite.flip_h = false
	else:
		$CharacterSprite.flip_h = true

func hit(damage_number: int):
	hp -= damage_number
	$AnimationPlayer.play("hit")
	print("Chicken hit")
	if(hp <= 0):
		ScoreManager.add_score(100)
		queue_free()
		#get_tree().get_root().get_node("Main/NewHUD").add_score(1)

func animations():
	if (velocity.length() < 10):
		$AnimationPlayer.play("idle_front")


func _on_enemy_hit_area_entered(body):
	if body.is_in_group("player"):
		print("Player hit")
		ScoreManager.decrease_Health()
		
