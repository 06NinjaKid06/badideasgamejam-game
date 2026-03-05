extends Area2D

func _process(_delta: float) -> void:
	var bodies = get_overlapping_bodies()
	#print(bodies) #OH MY SPAM
	if not bodies.find($"../Player"): # why does this work?
		print("player in area!")
		if Input.is_action_pressed("action"):
			print("action pressed!")
			get_tree().change_scene_to_file("res://scenes/ladder.tscn") # no player in this scene... hope you like 400 errors!

#func _on_body_entered(_body):
#	var bodies = get_overlapping_bodies()
#	print(bodies)
#	if bodies.find("Player"):
#		print("player in area!")
#		if Input.is_action_pressed("action"):
#			print("action pressed!")
#			get_tree().change_scene_to_file("res://scenes/ladder.tscn")
