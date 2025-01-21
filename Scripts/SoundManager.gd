extends Node
var music: bool
@onready var button_click: AudioStreamPlayer = $ButtonClick
func ButtonClick ():
	button_click.play()
