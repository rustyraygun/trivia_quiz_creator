extends Panel
onready var input_txt_line = get_node("HBoxContainer/txt_input")

var input_text: String

#func _ready():
#	Events.connect("view_quiz_select", self, "set_quiz_type_options")
	
func get_input_txt(new_txt: String):
	var txt = new_txt
	if txt != null:
		input_text = txt
		Game.game_config.current_player_name =  str(txt)
		


func _on_txt_input_text_changed(new_text):
	get_input_txt(new_text)
