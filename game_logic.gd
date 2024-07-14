extends Node3D
var dmg_area = preload("res://dmg_area.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if %Time.value <= 0:
		get_tree().paused = true
		%Panel.set_visible(true)
		%GameOver.set_visible(true)
		%Button.set_visible(true)
		
		%Button.set_disabled(false)
	else:
		get_tree().paused = false
	pass


func _on_button_pressed():
	get_tree().reload_current_scene()
	
	pass # Replace with function body.


func _on_timer_timeout():
	var dmgInst = dmg_area.instantiate()
	dmgInst.position.x = randf_range(-90,90)
	dmgInst.position.z = randf_range(-90,90)
	dmgInst.position.y = 0.02
	dmgInst.set_scale(Vector3(15,15,15))
	add_child(dmgInst)
	

	pass # Replace with function body.
