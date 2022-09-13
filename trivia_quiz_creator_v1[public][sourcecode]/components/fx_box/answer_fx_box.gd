extends CanvasLayer
onready var final_score_label = get_node("final_correct/VBoxContainer/VBoxContainer/score")
#0 correct, #1 incorrect, #2 final_correct
func _ready():
	Events.connect("quiz_complete", self, "show_final_quiz_data")
	$"final_correct/VBoxContainer/VBoxContainer/quiz_complete_msg".text = Game.game_config.quiz_complete_msg

func show_fx(type: int):
	match(type):
		0:
			$correct_answer.show()
			$correct_fx/CPUParticles2D.emitting =  true
			$die_timer.start(3.0)
		1:
			$incorrect.show()
			$die_timer.start(3.0)
		2:
			$final_correct.show()
			$correct_fx/CPUParticles2D.emitting =  true

func _on_die_timer_timeout():
	self.queue_free()
	
func show_final_quiz_data(_data: Dictionary):
	var _score = _data["score"]
	var _total_questions = _data["total_questions"]
	final_score_label.text = "Score: " +str(_score)+ "/" +str(_total_questions)
	


func _on_main_menu_pressed():
	Events.emit_signal("view_home_screen")
	self.queue_free()
