extends Area3D

func _on_body_entered(body:Node3D):
	if body.is_in_group("player"):
		body.player_health += 10
		print("Player health: ", body.player_health)
		queue_free()
