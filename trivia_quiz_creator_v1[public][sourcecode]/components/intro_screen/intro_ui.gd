extends Control



	


func _on_AnimationPlayer_animation_finished(_anim_name):
	Events.emit_signal("intro_complete")
