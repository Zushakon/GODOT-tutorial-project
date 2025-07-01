extends Node

# creates a global variiable for the number of gems collected
var gems_collected = 0

# makes esc return to main menu from everywhere
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("return_to_main_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
