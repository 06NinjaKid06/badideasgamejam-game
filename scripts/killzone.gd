extends Area2D
func _on_body_entered(_body):
 print("You Died!")
 get_tree().reload_current_scene()
