extends Node

signal intro_complete

#global_app_signals
signal app_core_loaded(msg)
signal data_error(msg)
#navigation
signal view_quiz_select
signal view_home_screen
signal view_quiz_box


#quiz game/play  data
signal set_quiz_box(msg)
signal check_quiz_answer(msg)
signal quiz_complete(msg)
