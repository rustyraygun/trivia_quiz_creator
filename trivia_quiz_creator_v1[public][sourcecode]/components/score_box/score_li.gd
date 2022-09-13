extends Panel


func set_score(category: String, score: int, name: String):
	$HBoxContainer/category.text = category
	$HBoxContainer/score.text = str(score)
	$HBoxContainer/name.text = name
