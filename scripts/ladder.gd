extends Area2D

var teleport_target_location = Vector2(100,100)

func _on_body_entered(body):
	if "Player" in body.name:
		body.global_position = teleport_target_location
