extends Node2D

@onready var back_button: Button = $BackButton 

func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)

	back_button.mouse_entered.connect(func(): mouse_interaction(back_button, "entered"))
	back_button.mouse_exited.connect(func(): mouse_interaction(back_button, "exited"))

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func mouse_interaction(button: Button, state: String) -> void:
	match state:
		"exited":
			button.modulate.a = 1.0
		"entered":
			button.modulate.a = 0.5
