extends State

var detect_range : Area2D 
var chasing_state : State

func initialize():
	detect_range = body.get_node("DetectionRange")
	chasing_state = get_parent().get_node("Chasing")
	
func process_state(delta: float):
	var potential_target = detect_range.get_overlapping_bodies()
	if (not potential_target.is_empty()):
		chasing_state.target = potential_target[0] as CharacterBody2D
		change_state.emit(chasing_state)
	