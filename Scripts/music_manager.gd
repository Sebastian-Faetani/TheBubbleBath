extends Node
@onready var fondo_menu: AudioStreamPlayer = $FondoMenu
@onready var sonido_ambiente: AudioStreamPlayer = $SonidoAmbiente


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fondoMenuStart():
	fondo_menu.play()
		
func fondoMenuStop():
	fondo_menu.stop()
	
func fondoSceneStart():
	sonido_ambiente.play()
		
func fondoSceneStop():
	sonido_ambiente.stop()
