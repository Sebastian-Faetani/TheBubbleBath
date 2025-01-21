extends RayCast3D

@onready var interact_ray: RayCast3D = $"."

func _process(delta):
	if is_colliding():
		Global.canInteract = true
		var collider = interact_ray.get_collider()
		if Input.is_action_just_released("interact"):
			if collider != null:
				if collider.is_in_group("window"):
					print("VENTANAAAAAAAAAAAAA")
		if collider != null:
			if collider.is_in_group("corridor") and GameManager.BoggartOn == true:
					print("Saquese de aqui chamaco")
	else:
		Global.canInteract = false
