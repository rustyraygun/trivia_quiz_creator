extends Button


func _on_btn_pressed():
	Events.emit_signal("check_quiz_answer", self.text)
