extends Area3D
var score = 0
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%Time.set_value(%Time.get_value()-10*delta)

	pass
