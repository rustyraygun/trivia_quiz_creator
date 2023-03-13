extends CanvasLayer
export(bool) var show_default_particles = true
onready var final_score_label = get_node("final_correct/VBoxContainer/VBoxContainer/score")
#0 correct, #1 incorrect, #2 final_correct
func _ready():
#	Events.connect("quiz_complete", self, "show_final_quiz_data")
	$"final_correct/VBoxContainer/VBoxContainer/quiz_complete_msg".text = Game.game_config.quiz_complete_msg

func show_fx(type: int):
	match(type):
		0:
			if show_default_particles:
				$correct_fx/CPUParticles2D.emitting =  true
			$correct_answer.show()
			
			$die_timer.start(3.0)
		1:
			$incorrect.show()
			$incorrect/VBoxContainer/main_msg.text = return_incorrect_msg()
			$die_timer.start(3.0)
		2:
			if show_default_particles:
				$correct_fx/CPUParticles2D.emitting =  true
			$final_correct.show()
		
			
		3:
			$incorrect.show()
			$incorrect/VBoxContainer/main_msg.text = "Out of Time!"
			$die_timer.start(3.0)
func return_incorrect_msg():
	var num =  round(rand_range(0, 3))
	var msg: String
	if num == 0:
		msg = "Good Try"
	elif num == 1: 
		msg = "Incorrect"
	elif num == 2:
		msg = "Nope!"
	elif num == 3: 
		msg = "Incorrect. but Good Try"
#	match(num):
#		0: msg = "Good Try"
#		1: msg = "Incorrect"
#		2: msg = "Nope!"
#		3: msg = "Incorrect. but Good Try"
	return msg
func _on_die_timer_timeout():
	self.queue_free()
	
func show_final_quiz_data(_data: Dictionary):
#	print("data"+str(_data))
	var _score = _data["score"]
	var _total_questions = _data["total_questions"]
	final_score_label.text = "Score: " +str(_score)+ "/" +str(_total_questions)
	


func _on_main_menu_pressed():
	Events.emit_signal("view_home_screen")
	self.queue_free()
