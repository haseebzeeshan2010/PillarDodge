extends Node3D

var rotate_scale = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotate_scale == true:
		if %Node3D.get_scale().x < 0.9:
			%Node3D.set_scale(Vector3(%Node3D.get_scale().x+0.5*delta,%Node3D.get_scale().y+0.5*delta,%Node3D.get_scale().z+0.5*delta))
	
		
		%StaticBody3D.position.y += 4*delta
	else:
		%GPUParticles3D.set_emitting(false)
		if %Node3D.get_scale().x > 0:
			%Node3D.set_scale(Vector3(%Node3D.get_scale().x-0.5*delta,%Node3D.get_scale().y-0.5*delta,%Node3D.get_scale().z-0.5*delta))
			%StaticBody3D.set_scale(Vector3(%StaticBody3D.get_scale().x-0.5*delta,%StaticBody3D.get_scale().y,%StaticBody3D.get_scale().z-0.5*delta))
		else:
			queue_free()
	rotation.y += 0.1
func _on_timer_timeout():
	rotate_scale = false

	
	pass # Replace with function body.
