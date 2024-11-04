extends Area2D

var velocity: Vector2 = Vector2(0, 0)

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity


func _on_time_to_live_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D):
	if(body as Enemy):
		body.hit(1)
		queue_free()
	if(body as Crabby):
		body.hit(1)
		queue_free()
	if(body as Goblin):
		body.hit(1)
		queue_free()
