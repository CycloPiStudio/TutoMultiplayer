extends KinematicBody
var bala = load("res://Player/Bala/bala.tscn") # Will load when the script is instanced.
var gravity = Vector3.DOWN * 12  # strength of gravity

var speed = 4  # movement speed

var jump_speed = 6  # jump strength

var spin = 0.1  # rotation speed


var velocity = Vector3()
var jump = false

func get_input():
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("adelante"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("atras"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("derecha"):
		velocity += transform.basis.x * speed
	if Input.is_action_pressed("izquierda"):
		velocity += -transform.basis.x * speed
	velocity.y = vy
	jump = false
	if Input.is_action_just_pressed("saltar"):
		jump = true
		dispara()
	if jump and is_on_floor():
		velocity.y = jump_speed
		
func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
		elif event.relative.x < 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
func dispara():
	print("dispara")
	var node = bala.instance()
	node.transform = global_transform
	get_parent().add_child(node)
	
	
