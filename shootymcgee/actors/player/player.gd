extends CharacterBody2D

@export var move_speed: float = 400.0
@export var projectile_scene: Resource

func _input(event):
	if(event is InputEventMouseButton):
		#Only shoot left click down, single shot 
		if(event.button_index == 1 and event.is_pressed()):
			var new_projectile = projectile_scene.instantiate()
			get_parent().add_child(new_projectile)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_projectile.fire(projectile_forward, 20.0)
			new_projectile.position = $ProjectileRefPoint.global_position
		
		# This is the shotgun spread code 
		if(event.button_index == 2 and event.is_pressed()):
			var new_projectile = projectile_scene.instantiate()
			var new_projectile2 = projectile_scene.instantiate()
			var new_projectile3 = projectile_scene.instantiate()
			get_parent().add_child(new_projectile)
			get_parent().add_child(new_projectile2)
			get_parent().add_child(new_projectile3)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_projectile.fire(projectile_forward, 10.0)
			new_projectile.position = $ProjectileRefPoint.global_position
			
			var projectile_forward2 = position.direction_to(get_global_mouse_position()).rotated(0.2)
			new_projectile2.fire(projectile_forward2, 10.0)
			new_projectile2.position = $ProjectileRefPoint.global_position 
			
			var projectile_forward3 = position.direction_to(get_global_mouse_position()).rotated(-0.2)
			new_projectile3.fire(projectile_forward3, 10.0)
			new_projectile3.position = $ProjectileRefPoint.global_position
	
	# Shockwave or circle bullets 
	if(Input.is_key_pressed(KEY_Q) and event.is_pressed()):
		var new_projectile = projectile_scene.instantiate()
		var new_projectile2 = projectile_scene.instantiate()
		var new_projectile3 = projectile_scene.instantiate()
		var new_projectile4 = projectile_scene.instantiate()
		var new_projectile5 = projectile_scene.instantiate()
		var new_projectile6 = projectile_scene.instantiate()
		var new_projectile7 = projectile_scene.instantiate()
		var new_projectile8 = projectile_scene.instantiate()
		var new_projectile9 = projectile_scene.instantiate()
		var new_projectile10 = projectile_scene.instantiate()
		var new_projectile11 = projectile_scene.instantiate()
		var new_projectile12 = projectile_scene.instantiate()
		get_parent().add_child(new_projectile)
		get_parent().add_child(new_projectile2)
		get_parent().add_child(new_projectile3)
		get_parent().add_child(new_projectile4)
		get_parent().add_child(new_projectile5)
		get_parent().add_child(new_projectile6)
		get_parent().add_child(new_projectile7)
		get_parent().add_child(new_projectile8)
		get_parent().add_child(new_projectile9)
		get_parent().add_child(new_projectile10)
		get_parent().add_child(new_projectile11)
		get_parent().add_child(new_projectile12)
			
		var projectile_forward = Vector2.from_angle(rotation)
		new_projectile.fire(projectile_forward, 10.0)
		new_projectile.position = $ProjectileRefPoint.global_position
		
		var projectile_forward8 = Vector2.from_angle(rotation + 0.5)
		new_projectile8.fire(projectile_forward8, 10.0)
		new_projectile8.position = $ProjectileRefPoint.global_position
			
		var projectile_forward2 = Vector2.from_angle(rotation + 1)
		new_projectile2.fire(projectile_forward2, 10.0)
		new_projectile2.position = $ProjectileRefPoint.global_position
		
		var projectile_forward7 = Vector2.from_angle(rotation + 1.5)
		new_projectile7.fire(projectile_forward7, 10.0)
		new_projectile7.position = $ProjectileRefPoint.global_position  
		
		var projectile_forward5 = Vector2.from_angle(rotation + 2)
		new_projectile5.fire(projectile_forward5, 10.0)
		new_projectile5.position = $ProjectileRefPoint.global_position
		
		var projectile_forward10 = Vector2.from_angle(rotation + 2.5)
		new_projectile10.fire(projectile_forward10, 10.0)
		new_projectile10.position = $ProjectileRefPoint.global_position
		
		var projectile_forward9 = Vector2.from_angle(rotation - 0.5)
		new_projectile9.fire(projectile_forward9, 10.0)
		new_projectile9.position = $ProjectileRefPoint.global_position
			
		var projectile_forward3 = Vector2.from_angle(rotation - 1)
		new_projectile3.fire(projectile_forward3, 10.0)
		new_projectile3.position = $ProjectileRefPoint.global_position
		
		var projectile_forward11 = Vector2.from_angle(rotation - 1.5)
		new_projectile11.fire(projectile_forward11, 10.0)
		new_projectile11.position = $ProjectileRefPoint.global_position
		
		var projectile_forward4 = Vector2.from_angle(rotation - 2)
		new_projectile4.fire(projectile_forward4, 10.0)
		new_projectile4.position = $ProjectileRefPoint.global_position
		
		var projectile_forward12 = Vector2.from_angle(rotation - 2.5)
		new_projectile12.fire(projectile_forward12, 10.0)
		new_projectile12.position = $ProjectileRefPoint.global_position
		
		var projectile_forward6 = Vector2.from_angle(rotation - 3.15)
		new_projectile6.fire(projectile_forward6, 10.0)
		new_projectile6.position = $ProjectileRefPoint.global_position
		
	
func _physics_process(delta):
	# look_at(get_viewport().get_mouse_position())
	
	velocity = Input.get_vector("move_left", \
		"move_right",\
		"move_up",\
		"move_down") * move_speed
	move_and_slide()
	
	# Math to sort out direction and animation
	var angle = rad_to_deg(velocity.angle()) + 180
	if (velocity.length() < 10):
		$AnimationPlayer.play("idle_front")
	else:
		if (angle  > 225 and angle  < 315):
			$AnimationPlayer.play("walk_front")
		elif (angle  > 135 and angle  < 225):
			$AnimationPlayer.play("walk_right")
		elif (angle  > 315 or angle  < 45):
			$AnimationPlayer.play("walk_left")
		elif (angle  > 45 and angle  < 135):
			$AnimationPlayer.play("walk_back")
