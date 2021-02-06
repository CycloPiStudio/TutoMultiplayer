extends Node

var network = NetworkedMultiplayerENet.new()
var puerto = 1909
var max_players = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	EmpezarServidor()
	get_node("Interface/Escala-Info/Info2puerto").set_text("Acho Pi; puerto: " + str(puerto))
	pass # Replace with function body.

func EmpezarServidor():
	network.create_server(puerto, max_players)
	get_tree().set_network_peer(network)
	print("empiezo servidor")
	var ipServidor
	print("empiezo servidor")
	ipServidor = "servidor IP: "+ str(IP.get_local_addresses()[1]) 
	actualizar_pantalla(ipServidor)
	network.connect("peer_connected", self,"_Par_Conectado")
	network.connect("peer_disconnected", self,"_Par_Desonectado")
	print("IP2", IP.get_local_addresses())

func _Par_Conectado (id):
	print("Usuario " + str(id) +"conectado")
	var usuarioCO = "Usuario " + str(id) + "conectado"
	actualizar_pantalla(usuarioCO)
#	actualizar_pantalla(("Usuario " + str(id_jugador) + " conectado"))

func _Par_Desonectado (id):
	var usuarioDESCO = "Usuario " + str(id) + "DESconectado"
	actualizar_pantalla(usuarioDESCO)
	print("Usuario " + str(id))
	
#func _process(delta):

func actualizar_pantalla(salida):
	get_node("Interface/Escala-Info/Info").set_text("Acho Pi: " + str(salida))
	print(salida)
#	pass
