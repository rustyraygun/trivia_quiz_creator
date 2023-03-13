extends Node
var _categories: Dictionary = {}
func _ready():
	load_categories()

func load_categories():
	var file = File.new()
	#^ add error catch
	if file.open("res://data/categories.json", File.READ) == OK:
		_categories = JSON.parse(file.get_as_text()).result.contents
		
	file.close()
	Game.game_config.categories = _categories

#	print("Game Categories: " + str(Game.game_config.categories ))
