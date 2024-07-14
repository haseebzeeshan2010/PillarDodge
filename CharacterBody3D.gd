extends RigidBody3D
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("accelerate"):
		apply_central_force(global_transform.basis.z * -25)
	elif Input.is_action_pressed("reverse"):
		apply_central_force(global_transform.basis.z * 25)
	
	if Input.is_action_pressed("left"):
		set_constant_torque(Vector3(0,50,0))
	elif Input.is_action_pressed("right"):
		set_constant_torque(Vector3(0,-50,0))
	else:
		set_constant_torque(Vector3(0,0,0))	
	
	pass


func _on_static_body_3d_2_body_entered(body):
	score+= 10
	%Label.set_text(str(score))
	
	
	%Target.global_position.x = randf_range(-50,50)
	%Target.global_position.z = randf_range(-50,50)
	%Time.set_value(100)
	pass # Replace with function body.
