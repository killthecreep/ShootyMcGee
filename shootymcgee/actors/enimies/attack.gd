extends NewState
class_name Attack

@export var move_speed := 5000.0
@export var enemy: CharacterBody2D
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")

func Physics_Update(delta):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed * delta
	else:
		enemy.velocity = Vector2()
		
		
	enemy.move_and_slide()
		
	#if direction.length() < 200:
		#Transitioned.emit(self, "Follow")
		#print("Trans to Follow")
	
	if direction.length() > 250:
		Transitioned.emit(self, "Idle")
		print("Trans to Idle")
	#else:
		#Transitioned.emit(self, "Follow")
		#print("Trans to follow")
