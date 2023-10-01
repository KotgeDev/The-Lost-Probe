extends Control

@export var starting_level: PackedScene

func _on_start_button_pressed():
    get_tree().change_scene_to_packed(starting_level)

func _on_quit_button_pressed():
    get_tree().quit()
