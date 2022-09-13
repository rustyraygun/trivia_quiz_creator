extends Control
onready var game_categories = Game.game_config.categories
var cat_select_btn = preload("res://components/category_select/category_select_button.tscn")
onready var btn_container = get_node("VBoxContainer")
func _ready():
#	$VBoxContainer/Button.text = str(game_categories[0]["name"])
	set_categories()


func set_categories():
	for cats in game_categories.size():
		var cat = cat_select_btn.instance()
		btn_container.add_child(cat)
		cat.set_cat_text(game_categories[cats]["name"])
		
