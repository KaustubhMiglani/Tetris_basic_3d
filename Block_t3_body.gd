extends RigidBody

var UP=Vector3(0,1,0)

var can_rotate=true
func _ready():
	apply_central_impulse(Vector3(0,-1,0))
func _physics_process(delta):
	if(Input.is_action_just_pressed("rotate") and can_rotate):
		rotation_degrees.y+=(90)
	if(Input.is_action_just_pressed("fast down")):
		apply_central_impulse(Vector3(0,-10,0))
func _on_Block_t3_body_body_entered(body):
	can_rotate=false
	pass
