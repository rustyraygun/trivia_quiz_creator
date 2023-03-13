extends Control


onready var quiz_questions = get_node("../../../game_config").questions
var q_box = preload("res://components/questions_box/questions_box.tscn")
var single_questions = []
var total_single_choice: int
func _ready():
	
	total_single_choice = get_total_single_questions()
	get_questions()
	set_labels()
	
func get_questions():
	var q = 0
	for _q in quiz_questions["single_choice"].size():
	
		print("Q:" + str(q))
#		print(str(quiz_questions["single_choice"][q]) + "\n")
#		single_questions.append(quiz_questions["single_choice"][q])
		var new_q = q_box.instance()
		$VBoxContainer/ScrollContainer/questions_list.add_child(new_q)
		new_q.index_label.text = str(str([q]) + ": " + str(quiz_questions["single_choice"][q]["category"]))
		new_q.question_label.text = str(quiz_questions["single_choice"][q]["question"])
		q += 1 
func get_total_single_questions():
	return quiz_questions["single_choice"].size()
	
func set_labels():
	$VBoxContainer/questions_details_vbox/single_total.text = "Total Single-Choice:" + str(total_single_choice)

