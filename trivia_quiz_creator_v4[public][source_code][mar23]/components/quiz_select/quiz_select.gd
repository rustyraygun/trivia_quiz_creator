extends Control
export(int) var ui_num = 1
var quiz_ready: bool = true
var quiz_select_data = {
	"select_category": "00",
	"select_type": "00",
	"select_timer": "00"
}

func _ready():
	Events.connect("data_error", self, "_data_error")
	
func _data_error(error_msg: String):
	quiz_ready = false
	$"vbox/start".text =  error_msg
	yield(get_tree().create_timer(3.0), "timeout")
	$"vbox/start".text =  "start"



func _on_start_pressed():
	
	if quiz_ready:
		Events.emit_signal("view_quiz_box")
		Events.emit_signal("set_quiz_box", quiz_select_data)




