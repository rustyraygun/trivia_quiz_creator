extends Node

#
#export (NodePath) var game_config
onready var game_config =  self.get_child(0)

func _ready():
	Events.emit_signal("app_core_loaded")
