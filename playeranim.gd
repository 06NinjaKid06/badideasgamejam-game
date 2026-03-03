extends AnimatedSprite2D

var sit_down_time = 10 # will sit down after 10 seconds of idling
var state = ""
var idle_timer = 0

func _process(delta: float):
	if Input.is_action_pressed("jump") and animation == "idle":
		play("jump")
	if Input.is_action_pressed("action") and Input.is_action_pressed("jump"):
		play("action_up")
	if Input.is_action_pressed("action") and Input.is_action_pressed("left"):
		play("action_left")
	if Input.is_action_pressed("action") and Input.is_action_pressed("right"):
		play("action_right")
	if Input.is_action_just_pressed("action"):
		play("action_down")
	if Input.is_action_pressed("left") and not Input.is_action_pressed("action"):
		play("walk_left")
	if Input.is_action_pressed("right") and not Input.is_action_pressed("action"):
		play("walk_right")
	if Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("action") or Input.is_action_pressed("jump"):	# if moving
		if state != "Moving":
			state = "Moving"
			idle_timer = 0	# reset timer
	else:	# if idling
		if state != "Sitting":	# if not sitting yet
			idle_timer += delta # advance timer
			if sit_down_time <= idle_timer:	# if timer reached "sit down" time
				state = "Sitting"
				play("idle_wait") # play sit down anim
				await animation_looped
				play("sleep")
			elif state != "Idle": # if it isn't time to sit down yet
				state = "Idle"
				play("idle") # play normal idle anim
