extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocidad = 100
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	transform.origin += Vector3(0,1,0) * velocidad * delta
	transform[3] += Vector3.FORWARD * velocidad * delta
	pass


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
