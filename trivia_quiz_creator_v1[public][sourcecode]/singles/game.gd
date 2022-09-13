extends Node

var app_core
var game_config
var global_theme
var all_scores = {}
#	0: {"category": "Art", "score": 400, "player_name": "Harold"}

func _ready():
	app_core = get_node("/root/app_core")
	game_config = app_core.get_child(0)
	global_theme = app_core.get_child(0).get_node("theme").theme
