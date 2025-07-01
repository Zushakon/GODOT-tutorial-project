#this script controls every level
extends Node2D

#used to label level number without having to manually print it
@export var level_num = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
# Calls level function from HUD script to label current level number
	$HUD.level(level_num)
	set_gems_label()
# automatically connects all gems in scene to the signal "gem_collected" so they can be added to the counter
#the "gem_collected" signal is made in the gem script
	for gem in $Gems.get_children():
		gem.gem_collected.connect(_on_gem_collected)


#makes hitting esc return to the main menu
func _input(event: InputEvent) -> void:
#makes hitting "r" reset the current level
	if event.is_action_pressed("reset_level"):
		get_tree().reload_current_scene.call_deferred()
#resets gem count when restarting the level
		Global.gems_collected = 0
		set_gems_label()


# increments gem count when collecting gems
func _on_gem_collected() -> void:
	$HUD.gems(Global.gems_collected)


# sets the label for the gems to the global number of gems collected
func set_gems_label():
	$HUD/GemsLabel.text = "Gems: " + str(Global.gems_collected)


# takes player to the level the door is connected to
func _on_door_player_entered(level: Variant) -> void:
# "call_deferred" makes it wait until the physics is done processing to change the level, otherwise you get an error
		get_tree().call_deferred("change_scene_to_file", level)
