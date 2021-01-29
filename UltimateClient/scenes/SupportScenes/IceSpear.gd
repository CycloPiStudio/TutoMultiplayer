extends Area

signal exploded

export var muzzle_velocity = 50
export var g = Vector3.DOWN * 20
var velocity = Vector3.ZERO
var damage


func _ready():
	Server.FetchSkillDamage("Ice Spears", get_instance_id())
	
func SetDamage(s_damage):
	damage = s_damage
	print("mira :",  damage)
	print("mira :",  damage)
	print("mira :",  damage)

func _physics_process(delta):
	velocity += g * delta
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta


func _on_Bullet_body_entered(body):
	emit_signal("exploded", transform.origin)
	
	if body.is_in_group("Enemies"):
		body.OnHit(damage)
	
	queue_free()



