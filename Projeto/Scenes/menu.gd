extends Control

@onready var play_button      = $VBoxContainer/HBoxContainer/VBoxContainer/PlayButton
@onready var play_ai_button   = $VBoxContainer/HBoxContainer/VBoxContainer/PlayAIButton
@onready var quit_button      = $VBoxContainer/HBoxContainer/VBoxContainer/QuitButton

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	play_ai_button.pressed.connect(_on_play_ai_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

	play_button.mouse_entered.connect(func(): mouse_interaction(play_button, "entered"))
	play_button.mouse_exited.connect(func(): mouse_interaction(play_button, "exited"))

	play_ai_button.mouse_entered.connect(func(): mouse_interaction(play_ai_button, "entered"))
	play_ai_button.mouse_exited.connect(func(): mouse_interaction(play_ai_button, "exited"))

	quit_button.mouse_entered.connect(func(): mouse_interaction(quit_button, "entered"))
	quit_button.mouse_exited.connect(func(): mouse_interaction(quit_button, "exited"))

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_play_ai_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_ai.tscn")

func _on_quit_pressed():
	get_tree().quit()

func mouse_interaction(button: Button, state: String) -> void:
	match state:
		"exited":
			button.modulate.a = 1.0
		"entered":
			button.modulate.a = 0.5
