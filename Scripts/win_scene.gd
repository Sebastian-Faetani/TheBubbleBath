extends Control

func _ready() -> void:
    MusicManager.fondoMenuStart()
    
func _on_menu_button_pressed() -> void:
    MusicManager.fondoMenuStop()
    get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
func _on_exit_pressed() -> void:
    MusicManager.fondoMenuStop()
    SoundManager.ButtonClicked()
    get_tree().quit()


func _on_retry_pressed() -> void:
    MusicManager.fondoMenuStop()
    get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
