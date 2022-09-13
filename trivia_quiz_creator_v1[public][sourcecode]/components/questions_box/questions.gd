extends Node
func _ready():

	load_questions()
var data ={}

var questions: Dictionary = {}

	
func load_questions():
	var file = File.new()
	if file.open("res://data/questions.json", File.READ) == OK:
		questions = JSON.parse(file.get_as_text()).result.contents
		Game.game_config.questions = questions

	file.close()

#	print("dictionary_Qs: " + str(Game.game_config.questions ))
