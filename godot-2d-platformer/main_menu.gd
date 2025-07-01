extends Node2D


func _ready() -> void:
# focuses the start button so you don't have to hover ovver it to interact with it
	$Options/StartButton.grab_focus()
	
	#hides fullscreen and quit buttons on platforms other than pc
	if !OS.has_feature("pc"):
		$Options/Fullscreen.hide()
		$Options/Quitbutton.hide()

# Starts level 1 when the start button is pressed
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")

# when fullscreen button is [ressed, changes the game to fullscreen if its in windowed mode and vice versa
func _on_fullscreen_pressed() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

#closes game when quit button is pressed
func _on_quitbutton_pressed() -> void:
	get_tree().quit()
	
