extends Area2D

func _on_body_entered(_body) -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	print("betected (haha, get it...?)")
