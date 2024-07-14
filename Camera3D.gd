extends Camera3D
var diff = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position = lerp(global_position, %Marker3D.global_position, delta*5)
	global_rotation.y = lerp_angle(global_rotation.y, %Marker3D.global_rotation.y ,delta*5)
	#transform = lerp_angle(transform, %Marker3D.transform, delta) 
	#print(global_rotation.y- %CharacterBody3D.global_rotation.y)

	pass
