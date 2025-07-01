extends CharacterBody2D

#sets the speed of the player character
const SPEED = 250.0
#sets the jump velocity for the player character
#the lower the number the higher the jump
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Adds the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Makes player jump wehn pressing the jump
	# Jump button is defined in "Project Setting" under "Input Map"
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# plays sound effect when jumoing
		$jumpsfx.play()

# creates a variable for the direction the player is running
	var direction := Input.get_axis("move_left", "move_right")

	if direction:
# gives the player velocity in the direction they're moving
		velocity.x = direction * SPEED
#plays the running animation when moving
		$AnimatedSprite2D.play("run")
#flips the sprite horizontally if moving left
		if direction == -1:
			$AnimatedSprite2D.flip_h=true
# does not flip the sprite if running to the right
		else:
			$AnimatedSprite2D.flip_h=false
#plays the idle animation if the player is not moving
	else:
		$AnimatedSprite2D.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

#plays jump animation if the character is not on the floor
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		

	move_and_slide()
