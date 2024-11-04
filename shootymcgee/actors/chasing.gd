extends State

@export var chase_speed : float = 10000.0
@export var randomSpeed : float = 10000.0  # Maximum variation in speed
var target : CharacterBody2D

func process_state(delta: float):
	var direction = target.position - body.position
	
	if abs(direction.x) > abs(direction.y):
		direction.y = 0 
	else:
		direction.x = 0


	var random_speed = chase_speed + randf_range(-randomSpeed, randomSpeed)

	body.velocity = direction.normalized() * random_speed * delta

	body.move_and_slide()
