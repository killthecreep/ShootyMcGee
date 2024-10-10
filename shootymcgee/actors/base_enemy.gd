extends CharacterStateMachine
class_name Enemy

@export var hp: int = 3


func hit(damage_number: int):
	hp -= damage_number
	if(hp <= 0):
		ScoreManager.add_score(100)
		queue_free()
		#get_tree().get_root().get_node("Main/NewHUD").add_score(1)

func animations():
	if (velocity.length() < 10):
		$AnimationPlayer.play("idle_front")
