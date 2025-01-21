extends RayCast3D

func _process(delta):
	if is_colliding():
		Global.canInteract = true
		if Input.is_action_just_released("interact"):
			if get_collider().is_in_group("window") and get_collider().db != null:
				print("VENTANAAAAAAAAAAAAA")
	else:
		Global.canInteract = false
