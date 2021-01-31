extends Node2D

var preMapa = preload("res://scenes/Map.tscn")
var mapa
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Escala_label/TextEdit-ip").set_text(str(Server.ip))
	get_node("Escala_label/TextEdit-puerto").set_text(str(Server.port))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	


func _on_Button_pressed():
	Server.ip= str(get_node("Escala_label/TextEdit-ip").get_text())
	Server.port=int(get_node("Escala_label/TextEdit-puerto").get_text())
	Server.ConnectToserver()
	Server.network.connect("connection_succeeded", self, "conectado")
	pass # Replace with function body.

func conectado():
	$Panel.show()
	$servidor.show()
	get_node("Escala_label/carga").show()
	get_node("Timer").start()
	print(Server.ip)
	pass

func _on_Timer_timeout():
	mapa = preMapa.instance()
	get_node("/root").add_child(mapa)
	queue_free()
	pass # Replace with function body.
