extends RigidBody3D
var score = 0
var stage = 0
var modulate_val = false
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
	
	if len(%dmg_area.get_overlapping_bodies()) > 0:
		%Time.set_value(%Time.get_value()-40*delta)
		
	
	%StageLabel.set_text("Stage "+str(stage)+" Complete")	
	if modulate_val == true:
		%StageLabel.set_self_modulate(Color(0,20,5,clamp(%StageLabel.get_self_modulate().a+1*delta*2,0,1)))
		%Time.set_value(%Time.get_value()+100*delta)
	else:
		%StageLabel.set_self_modulate(Color(0,20,5,clamp(%StageLabel.get_self_modulate().a-1*delta*2,0,1)))
	print(modulate_val,"  ",clamp(%StageLabel.get_self_modulate().a,0,1))
	
	

func _on_static_body_3d_2_body_entered(body):
	score+= 10
	%Time.set_value(%Time.get_value()+30)
	%Label.set_text(str(score))
	
	
	%Target.global_position.x = randf_range(-50,50)
	%Target.global_position.z = randf_range(-50,50)

	
	if %Timer.get_wait_time() > 0.8:
		%Timer.set_wait_time(%Timer.get_wait_time()-%Timer.get_wait_time()/20)
		
	if fmod(score,100) == 0 and score >= 100:
		stage+=1
		%LabelTimer.start(2)
		modulate_val = true
	#print(%Timer.get_wait_time())
	pass # Replace with function body.


func _on_timer_timeout():
	modulate_val = false
	pass # Replace with function body.
