extends Node


export(Resource) var theme

func _ready():
	Events.connect("app_core_loaded", self, "set_theme")
	
func set_theme():
	pass
