extends Area3D

func _on_body_entered(body:Node3D):
	if body.is_in_group("player"):
		Global.ammo += 10
		print("Ammo collected! Current ammo: ", Global.ammo)
		queue_free()
