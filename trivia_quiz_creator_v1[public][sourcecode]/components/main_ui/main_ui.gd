extends Control


func _ready():
	Events.connect("view_quiz_select", self, "_view_quiz_select")
	Events.connect("view_quiz_box", self, "_view_quiz_box")
	Events.connect("view_home_screen", self, "_view_home_screen")
	
func _view_quiz_select():
	$quiz_select.show()
	hide_all(1)
	
func _view_quiz_box():
	$quiz_select.show()
	hide_all(2)
	
func _view_home_screen():
	$home_screen.show()
	$home_screen._set_home_screen()
	hide_all(0)
	
	
func hide_all(except: int):
	for kid in self.get_children():
		if kid.is_in_group("ui_page"):
			if kid.ui_num != except:
				kid.hide()
			else: kid.show()
