extends KinematicBody

export var speed = 2.0
export var torque = 4.0

func _physics_process(delta):
	var velocity = 0
	var direction = Vector3(0, 0, 0)
	
	# Movement
	if Input.is_action_pressed("move_forward"):
		velocity += 1
	elif Input.is_action_pressed("move_back"):
		velocity -= 1
	
	# Turning
	if Input.is_action_pressed("turn_left"):
		rotate_y(deg2rad(torque))
	elif Input.is_action_pressed("turn_right"):
		rotate_y(deg2rad(-torque))
	
	direction += global_transform.basis.z.normalized() * velocity
	
	move_and_slide(direction * speed)