extends Camera2D

@export var shake_strength : float = 10.0
@export var fade_rate: float = 2.0

var rng = RandomNumberGenerator.new()
var current_strength : float = 0.0

func _process(delta: float):
	if (current_strength > 0.0):
		current_strength = lerp(current_strength, 0.0, fade_rate * delta)
		offset = Vector2(\
		rng.randf_range(-current_strength, current_strength), \
		rng.randf_range(-current_strength, current_strength))

func do_shake():
	current_strength = shake_strength
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		do_shake()
