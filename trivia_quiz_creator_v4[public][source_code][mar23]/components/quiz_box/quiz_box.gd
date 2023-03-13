extends Control
export(int) var ui_num = 2
var active_quiz_data = {}
onready var top_bar = get_node("VBoxContainer/Panel")
onready var category_label = get_node("VBoxContainer/Panel/HBoxContainer/category_label")
onready var question_label = get_node("VBoxContainer/question_box/HBoxContainer/vbox/question_label")
onready var question_image = get_node("VBoxContainer/question_box/HBoxContainer/vbox/img")
onready var button_box = get_node("VBoxContainer/question_box/HBoxContainer/vbox/HBoxContainer2/HBoxContainer")
onready var btn0 = get_node("VBoxContainer/question_box/HBoxContainer/vbox/HBoxContainer2/HBoxContainer/btn0")
onready var btn1 = get_node("VBoxContainer/question_box/HBoxContainer/vbox/HBoxContainer2/HBoxContainer/btn1")
onready var btn2 = get_node("VBoxContainer/question_box/HBoxContainer/vbox/HBoxContainer2/HBoxContainer/btn2")
onready var btn3 = get_node("VBoxContainer/question_box/HBoxContainer/vbox/HBoxContainer2/HBoxContainer/btn3")
onready var total_questions_label = get_node("VBoxContainer/Panel/HBoxContainer/total_questions_label")
onready var timer_label = get_node("VBoxContainer/Panel/HBoxContainer/timer")
var default_answer_fx_box = preload("res://components/fx_box/answer_fx_box.tscn")
var game_questions: Array = []
var questions_answered: int = 0	
var answered_correctly: int = 0
var quiz_timed: bool = false
onready var quiz_question_timer = get_node("question_timer")
var total_q: int
var current_question: Dictionary = {}
var final_quiz_data: Dictionary = {
	"score": 0,
	"total_questions": 0
}

func _ready():
	quiz_question_timer.stop()
	
	self.set_process(false)
	Events.connect("set_quiz_box", self, "_set_quiz_box")
	Events.connect("check_quiz_answer", self, "check_answer")

	
	
func _process(delta):
	if quiz_timed:
		timer_label.text = "Time:"+  str(round(quiz_question_timer.time_left)) + "s"
		
func _set_quiz_box(quiz_data: Dictionary):
	Game.global_user_score["score"] =""
	Game.global_user_score["total_questions"] = ""
	
	active_quiz_data = quiz_data
	# func stopper
	var STOP: bool = false
#	top_bar.get_node("RichTextLabel").text = str(quiz_data)
	
	#set topbar
	category_label.text =  "Category:" + "\n" + active_quiz_data["select_category"]
	#Get total questions by type
	var quiz_type = active_quiz_data["select_type"]
	var quiz_category = active_quiz_data["select_category"]
	
	var questions 
	if Game.game_config.questions.has(quiz_type):
		questions = Game.game_config.questions[quiz_type]
#		total_q = questions.size()
#		print_debug("total questions: " + str(total_q))
	else: 
		STOP = true
	if STOP:
		return
	# Set Timer settings___
	if active_quiz_data["select_timer"] == "off" or active_quiz_data["select_timer"] == "00":
		print("Quiz NOT timed")
		set_timer(0, false)
		$VBoxContainer/Panel/HBoxContainer/timer.text = ""
	else: 
		quiz_timed = true
		print("Quiz is timed")
		
	
		
	#get total questions in category
	for _q in questions.size():
		
		var q = str(_q)
		if questions[q]["category"] == quiz_category:
			questions[q]["type"] = quiz_type
			game_questions.append(questions[q])
			total_q = game_questions.size()
			
	total_questions_label.text = str(questions_answered) +"/"+ str(total_q)
	game_questions.shuffle()
	set_current_question(game_questions[0])
	#set question #1
#	print("game question key: " + str(current_question["key"]))


func set_timer(time_left, on: bool):
	quiz_timed = on
	if quiz_timed:
		yield(get_tree().create_timer(0.8), "timeout")
		quiz_question_timer.paused = false
		quiz_question_timer.start(time_left)
		self.set_process(true)
	else: 
		quiz_question_timer.stop()
	timer_label.text = str(time_left)
		
	

func set_current_question(question: Dictionary):
	btn0.show()
	btn1.show()
	btn2.show()
	btn3.show()
	match(question["type"]):
		"single_choice":
			current_question["category"] = question["category"]
			current_question["question"] = question["question"]
			current_question["question_notes"] =  question["question_notes"]
			current_question["answer1"] =  question["answer1"]
			current_question["answer2"] =  question["answer2"]
			current_question["answer3"] =  question["answer3"]
			current_question["answer4"] =  question["answer4"]
			current_question["type"] =  question["type"]
			current_question["key"] =  question["key"]
			current_question["image"] = question["image"]
			match(int(current_question["key"])):
				0:
					pass
				1:
					current_question["correct_answer"] = question["answer1"]
				2:
					current_question["correct_answer"] = question["answer2"]
				3:
					current_question["correct_answer"] = question["answer3"]
				4:
					current_question["correct_answer"] = question["answer4"]
#			print("current question correct answer: " + str(current_question["correct_answer"]))
			btn0.text = current_question["answer1"] 
			btn1.text = current_question["answer2"] 
			btn2.text = current_question["answer3"] 
			btn3.text = current_question["answer4"] 
			
		"true_false":
			current_question["category"] = question["category"]
			current_question["question"] = question["question"]
			current_question["question_notes"] =  question["question_notes"]
			current_question["type"] =  question["type"]
			current_question["key"] =  question["key"]
			current_question["image"] = question["image"]
			btn0.text = "true"
			btn1.text = "false"
			btn2.hide()
			btn3.hide()
			
			
	#set game ui____
	question_label.text = current_question["question"]
	question_image.texture = load(current_question["image"])
	hide_blank_questions()
	
	if quiz_timed:
		match(active_quiz_data["select_timer"]):
			"00": 
				set_timer(0.0, false)
			"off":
				set_timer(0.0, false)
			"1 minute":
				set_timer(60, true) 
			"2 minutes":
				set_timer(120, true)
			"5 minutes":
				set_timer(300, true)
#questions = {
#	"single_choice": {0: {"category": "Art", "question": "Art Question one?", 
# "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": ""}}
#		}
func hide_blank_questions():
	for btns in button_box.get_children():
		if btns.text ==  "" or btns.text == "*hide":
			btns.hide()
	
	
func check_answer( _single_choice_answer: String):
	var _type = current_question["type"]
	match(_type):
		"single_choice":
			if _single_choice_answer ==  current_question["correct_answer"]:
#			if _single_choice_answer ==  current_question["answer"+str(current_question["key"])]:
				_celebrate(true)
			else: _celebrate(false)
		"true_false":
			if _single_choice_answer == str(current_question["key"]):
				_celebrate(true)
			else: _celebrate(false)
	quiz_question_timer.paused = true
				
func _next_question(question_num: int):
	#play next fx_box #min of 2 questions per cat
	set_current_question(game_questions[question_num])
					
				
func _celebrate(correct_answer: bool):
	var answer_fx_box
	if Game.game_config.use_custom_celebration:
		answer_fx_box = Game.game_config.custom_celebration
	else: 
		answer_fx_box = default_answer_fx_box

	match(correct_answer):
		true:
			answered_correctly += 1
			questions_answered += 1
			if questions_answered == total_q:
				Game.global_user_score["score"] =str(answered_correctly)
				Game.global_user_score["total_questions"] = str(total_q)
				_show_fx(answer_fx_box, 2)
				_quiz_complete()
				
#				print("Great Work!" + str(questions_answered)+" of "+ str(total_q)+ " questions answered!")
				#^ If go_to_next_catergory: set the next category
				
			else:
				_show_fx(answer_fx_box, 0)
				yield(get_tree().create_timer(1.5), "timeout")
#				print("Good Job!" + str(questions_answered)+" of "+ str(total_q))
				_next_question(questions_answered)
			
			#show celebration fx_box
		false:
			questions_answered += 1
			if questions_answered == total_q:
				Game.global_user_score["score"] =str(answered_correctly)
				Game.global_user_score["total_questions"] = str(total_q)
				_show_fx(answer_fx_box, 2)
				_quiz_complete()
			else:
				if quiz_timed and quiz_question_timer.time_left <= 0.0:
					_show_fx(answer_fx_box, 3)
				elif quiz_timed and quiz_question_timer.time_left > 0.0:
					_show_fx(answer_fx_box, 1)
				elif !quiz_timed:
					_show_fx(answer_fx_box, 1)
				yield(get_tree().create_timer(1.5), "timeout")
				_next_question(questions_answered)
	total_questions_label.text = str(questions_answered) +"/"+ str(total_q)
		
#var answer_fx_box = preload("res://components/fx_box/answer_fx_box.tscn")

func _show_fx(scene: PackedScene, type_num: int):
	var fx = scene.instance()
	Game.app_core.add_child(fx)
	fx.show_fx(type_num)
	
	fx.show_final_quiz_data(Game.global_user_score)

func _quiz_complete():
	#set final quiz data
	final_quiz_data["total_questions"] = str(total_q)
	final_quiz_data["score"] = str(answered_correctly)

	Events.emit_signal("quiz_complete", final_quiz_data)
	var date_data = OS.get_datetime()
	var current_date_time = str(date_data["month"]) +"/"+  str(date_data["day"]) +" | "+ str(date_data["hour"]) +" | "+ str(date_data["minute"])
	#send score to score-board
	var new_score_board_data = {
		0: {"category": current_question["category"], "score": answered_correctly, "player_name": str(Game.game_config.current_player_name)}
	}
	Game.all_scores[ int(Game.all_scores.size() ) ] = new_score_board_data[0]
	print("All scores: "+str(Game.all_scores))
	
	


	#reset current quiz data
	answered_correctly = 0
	total_q = 0
	questions_answered = 0
	current_question.clear()
	game_questions.clear()
	final_quiz_data.clear()
	quiz_question_timer.stop()
	quiz_timed =  false
#	quiz_question_timer.time_left = 0.0

func _on_question_timer_timeout():
	_celebrate(false)
	
func _unhandled_input(event):
	if event.is_action_pressed("quit_quiz"):
		_quiz_complete()
		Events.emit_signal("view_home_screen")
