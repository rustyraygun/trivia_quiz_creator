extends Panel
onready var options_btn = get_node("hbox/HBoxContainer/OptionButton")
onready var quiz_select_controller = $"../.."
onready var category_image_rect = get_node("../category_image")
func _ready():
	Events.connect("view_quiz_select", self, "set_quiz_cat_options")
	
#Get catergories from GameConfig, set quiz select buttons	
func set_quiz_cat_options():
	options_btn.clear()
	var cats = Game.game_config.categories
#	print_debug("CATS.size():  "+str(cats.size())   + "\n" )
#	print_debug("CATS0: "+str(cats)   + "\n" )
	for cat in cats["categories"].size():
		options_btn.add_item(cats["categories"][str(cat)]["name"])
#		print(str(cats["categories"][str(cat)]["name"]))
	#change to signal
	quiz_select_controller.quiz_select_data["select_category"] = options_btn.get_item_text(0)
	category_image_rect.texture = load(cats["categories"][str(0)]["image"])	


func _on_OptionButton_item_selected(index):
	var cats = Game.game_config.categories
	quiz_select_controller.quiz_select_data["select_category"] = options_btn.get_item_text(index)
#	print(str(get_parent().get_parent().quiz_select_data)  + "\n")	
	category_image_rect.texture = load(cats["categories"][str(index)]["image"])
	
