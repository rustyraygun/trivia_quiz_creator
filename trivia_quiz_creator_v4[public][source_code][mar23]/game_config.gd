extends Node


export (Dictionary) var game_details = {"name":"Quiz 1", "author": "Trivia Team", "about": "Quiz # 1 by trivia team zer0"}
export (Dictionary) var categories = {
	0: {"name": "Art", "image": Texture},
	1: {"name": "Science", "image": Texture},
	2: {"name": "Film", "image": Texture},
	3: {"name": "History", "image": Texture},
	4: {"name": "Design", "image": Texture},
	}
export (Theme) var theme

export (Dictionary) var questions = {
	"single_choice": {
		0: {"category": '', "question": '', "question_notes": '', "answer1": '', "answer2": '', "answer3": '', "answer4": '', "key": 3, "image": Texture},

			},
			
		"multiple_choice": {
		0: {"category": '', "question": '', "question_notes": '', "answer1": '', "answer2": '', "answer3": '', "answer4": '', "key": [0,3]},
	
			},
			
		"true_false": {
		0: {"category": '', "question": '', "question_notes": '', "key": true},
		
			}
			
		}

#Homepage
export(Texture) var home_main_image


#	0: "single_choice",
#	1: "multiple_choice",
#	2: "true_false",
#	3: "any"


#export (Dictionary) var questions = {
#	"single_choice": {
#		0: {"category": "Art", "question": "Art Question one?", "question_notes": "notes", "answer1": "Black", "answer2": "Yellow", "answer3": "Red", "answer4": "Blue", "key": 3, "image": Texture},
#		1: {"category": "Science", "question": "Art Question one?", "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": "", "key": 3, "image": Texture},
#		2: {"category": "Art", "question": "Art Question one?", "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": "", "key": 3, "image": Texture},
#		3: {"category": "Film", "question": "Art Question one?", "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": "", "key": 3, "image": Texture},
#			},
#
#		"multiple_choice": {
#		0: {"category": "Art", "question": "Art Question one?", "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": "", "key": [0,3]},
#		1: {"category": "Science", "question": "Art Question one?", "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": "", "key": [0,3]},
#		2: {"category": "Science", "question": "Art Question one?", "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": "", "key": [0,3]},
#		3: {"category": "Film", "question": "Art Question one?", "question_notes": "", "answer1": "", "answer2": "", "answer3": "", "answer4": "", "key": [0,3]},
#			},
#
#		"true_false": {
#		0: {"category": "Film", "question": "Art Question one?", "question_notes": "", "key": true},
#		1: {"category": "Film", "question": "Art Question one?", "question_notes": "", "key": true},
#		2: {"category": "Film", "question": "Art Question one?", "question_notes": "", "key": true},
#		3: {"category": "Design", "question": "Art Question one?", "question_notes": "","key": true},
#			}
#
#		}
