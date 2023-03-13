extends Panel
onready var options_btn = get_node("hbox/HBoxContainer/OptionButton")
onready var quiz_select_controller = $"../.." #make signal
var quiz_types = {
	0: "single_choice",
	1: "true_false",
#	2: "multiple_choice",
#	3: "any"
}

func _ready():
	Events.connect("view_quiz_select", self, "set_quiz_type_options")
	
#Get catergories from GameConfig, set quiz select button	
func set_quiz_type_options():
	options_btn.clear()
	for type in quiz_types.size():
		options_btn.add_item(quiz_types[type])
		
	quiz_select_controller.quiz_select_data["select_type"] = options_btn.get_item_text(0)
	


func _on_OptionButton_item_selected(index):
	#yeah yeah 
	var btn_text = options_btn.get_item_text(index)
	quiz_select_controller.quiz_select_data["select_type"] = btn_text
	if !Game.game_config.questions.has(btn_text):
		Events.emit_signal("data_error", "[JSON Data-Error] Quiz type not found! [REFRESH required]")
