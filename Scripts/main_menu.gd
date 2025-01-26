extends Control

func _ready() -> void:
	MusicManager.fondoMenuStart()

func _on_play_pressed() -> void:
	MusicManager.fondoMenuStop()
	SoundManager.ButtonClicked()
	get_tree().change_scene_to_file("res://Scenes/video_scene.tscn")


func _on_credits_pressed() -> void:
	SoundManager.ButtonClicked()
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	SoundManager.ButtonClicked()
	get_tree().quit()
