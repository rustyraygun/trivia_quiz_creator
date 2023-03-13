extends Control
export(int) var ui_num = 0
var score_li = preload("res://components/score_box/score_li.tscn")
onready var score_box_ul = get_node("vbox/score_box/score_box_ul")
var game_details 
func _ready():
	Events.connect("intro_complete", self, "_set_home_screen")
	
func _set_home_screen():
	self.show()
	#change to home screen ready /loader finished signal
	set_game_details()
	set_score_box()
	set_home_images()
	
func set_game_details():
	game_details = Game.game_config.game_details
	var quiz_name =  game_details["name"]
	var author = game_details["author"]
	var about = game_details["about"]
	var text = "You're about to play " + str(quiz_name) + " by " + str(author) + "\n" + str(about)
	$"vbox/game_details/VBoxContainer/RichTextLabel".text = text


func set_score_box():
	var scores = Game.all_scores
	for i in score_box_ul.get_children(): #change to load from saved data ^
		i.queue_free()
	if scores.size() > 0:
		for score in scores.size():
			var li = score_li.instance()
			score_box_ul.add_child(li)
			li.set_score(scores[score]["category"], scores[score]["score"], scores[score]["player_name"])
			
	
func set_home_images():
	$vbox/score_box/score_box_bkgrnd_img.texture = Game.game_config.home_main_image


func _on_play_pressed():
	Events.emit_signal("view_quiz_select")
