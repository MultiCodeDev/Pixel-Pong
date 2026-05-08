extends RigidBody2D

var last_velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.reflect_ball.connect(reflect)
	#last_velocity = linear_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#func _physics_process(delta: float) -> void:
	#last_velocity = linear_velocity
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if state.get_contact_count() > 0:
		var normal = state.get_contact_local_normal(0)
		var new_vel = last_velocity.bounce(normal)
		state.linear_velocity = new_vel
		

func reflect() -> void:
	#linear_velocity.x *= -1
	if $Sprite2D.flip_h != true:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	
	print("Hello")
	
