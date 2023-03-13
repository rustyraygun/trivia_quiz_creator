extends Panel


onready var options_btn = get_node("HBoxContainer/OptionButton")
var timer_types = {
	0: "off",
	1: "1 minute",
	2: "2 minutes",
	3: "5 minutes"
}

func _ready():
	Events.connect("view_quiz_select", self, "set_quiz_type_options")
	
#Get catergories from GameConfig, set quiz select button	
func set_quiz_type_options():
	options_btn.clear()
	for type in timer_types.size():
		options_btn.add_item(timer_types[type])
	get_parent().get_parent().quiz_select_data["select_timer"] = options_btn.get_item_text(0)



func _on_OptionButton_item_selected(index):
	get_parent().get_parent().quiz_select_data["select_timer"] = options_btn.get_item_text(index) #makesignal
