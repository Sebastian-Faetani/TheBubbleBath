extends Node

var canInteract : bool

func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
