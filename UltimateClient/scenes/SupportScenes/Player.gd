extends KinematicBody


var IceSpear = preload("res://scenes/SupportScenes/IceSpear.tscn")
export var gravity = Vector3.DOWN * 10
export var speed = 10
export var rot_speed = 1

var velocity = Vector3.ZERO

func _physics_process(delta):
	get_input(delta)
	velocity += gravity * delta
	
	velocity = move_and_slide(velocity, Vector3.UP)
	$Position3D/Camera.look_at(transform.origin, Vector3.UP)
func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("acelerar"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("frenar"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("derecha"):
		rotate_y(-rot_speed * delta)
	if Input.is_action_pressed("izquierda"):
		rotate_y(rot_speed * delta)
	if Input.is_action_just_pressed("disparar"):
		var b = IceSpear.instance()
		get_parent().add_child(b)
		b.transform = $Canon.global_transform
		b.velocity = -b.transform.basis.z * b.muzzle_velocity
	
	velocity.y = vy


