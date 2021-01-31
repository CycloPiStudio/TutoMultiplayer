extends Node

var network = NetworkedMultiplayerENet.new()
var ip ="95.39.148.104"
# var a = 2
var port = 6969


# Called when the node enters the scene tree for the first time.
func _ready():
	ConnectToserver()

func ConnectToserver():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_failed", self, "_OnConnectionFailed")
	network.connect("connection_succeeded", self, "_OnConnectionSucceeded")
	print("cccccccccccccc")
func _OnConnectionFailed():
	print("connection failed")
func _OnConnectionSucceeded():
	print("connection succeeded")
	
func FetchSkillDamage(sKill_name, requester):
	rpc_id(1, "FetchSkillDamage", sKill_name, requester)
	print("hola me cago ento")

#remote func ReturnSkillDamage(s_damage, requester):
#	instance_from_id(requester).SetDamage(s_damage)
