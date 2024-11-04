extends CharacterStateMachine
class_name Crabby

@export var hp: int = 5

var angle = rad_to_deg(velocity.angle()) + 180

func _physics_process(delta):
	animations()
	current_state.process_state(delta)

func hit(damage_number: int):
	hp -= damage_number
	if(hp <= 0):
		ScoreManager.add_score(100)
		queue_free()
		#get_tree().get_root().get_node("Main/NewHUD").add_score(1)

func _on_crabby_hit_area_entered(body):
	if body.is_in_group("player"):
		print("Player hit")
		ScoreManager.decrease_Health()

func animations():
	if (velocity.length() < 10):
		$AnimationPlayer.play("Idle")
	else:
		$AnimationPlayer.play("Chasing")
		if (rotation  > 135 and rotation  < 225):
			Sprite2D.flip_v = $AnimationPlayer.play("Chasing")
