extends Node

var BoggartOn : bool
var WindowOpened : bool
var WindowOpening : bool
var WindowClosing : bool
var DoorOpening : bool
var DoorOpen : bool
var GameOver : bool
var BoggartSprite1 : bool
var BoggartSprite2 : bool
var BoggartSprite3 : bool
var EyesClosed : bool
var GameWon : bool
var EyesHurty : bool
var animStop : bool
var boggartStep : bool




func _ready() -> void:
	BoggartOn = false
	WindowOpened = false
	WindowOpening = false
	WindowClosing = false
	DoorOpen = false
	DoorOpening = false
	GameOver = false
	BoggartSprite1 = false
	BoggartSprite2 = false
	BoggartSprite3 = false
	EyesClosed = false
	GameWon = false
	EyesHurty = false
	animStop = false
	boggartStep = false
