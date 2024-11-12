extends Node3D

func _on_area_3d_body_entered(body: Node3D):
	if body.is_in_group("player"):
		Global.current_level = 2
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
