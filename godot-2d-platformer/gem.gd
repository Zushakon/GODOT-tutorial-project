extends Area2D

#creates a signal for when the player collects a gem
signal gem_collected

# when the player walks into a gem, the gem is collected
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
# increments the global gem count by 1 when a gem is collected
		Global.gems_collected += 1
# emits the previous signal
		gem_collected.emit()
# plays sound effect when gem is collected
		$collectsfx.play()
# hides the gem as soon as it's collected
		hide()

# stops the queue_free function from removing the gem until the sound effect is finished playing
func _on_collectsfx_finished() -> void:
# removes the collected gem from the scene
		queue_free()
