extends Node

var network = NetworkedMultiplayerENet.new()
var puerto = 1909
var max_players = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	EmpezarServidor()
	pass # Replace with function body.

func EmpezarServidor():
	network.create_server(puerto, max_players)
	get_tree().set_network_peer(network)
	print("empiezo servidor")
	network.connect("peer_connected", self,"_Par_Conectado")
	network.connect("peer_disconnected", self,"_Par_Desonectado")

func _Par_Conectado (id_jugador):
	print(("Usuario " + str(id_jugador+" conectado")))

func _Par_Desonectado (id_jugador):
	print(("Usuario " + str(id_jugador+" desconectado")))
#func _process(delta):
#	pass
