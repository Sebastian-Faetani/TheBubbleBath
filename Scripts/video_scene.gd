extends Control

@onready var skip: Button = $Skip
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer


func _on_skip_pressed() -> void:
	SoundManager.ButtonClicked()
	video_stream_player.stop()
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")


func _on_video_stream_player_finished() -> void:
	video_stream_player.stop()
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
