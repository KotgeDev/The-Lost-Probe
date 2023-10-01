extends Node2D

@export var next_level: PackedScene 

@onready var objective = $Objective
@onready var player = $Player
@onready var hud = $HUD

func _ready(): 
    objective.body_entered.connect(_on_objective_body_entered)
    player.hit.connect(_on_player_hit)
    hud.retry.connect(_retry)
    hud.return_to_menu.connect(_return_to_menu)

func _retry() -> void: 
    get_tree().change_scene_to_file(scene_file_path)

func _return_to_menu() -> void:
    get_tree().change_scene_to_file("res://scenes/ui/menu.tscn")

func _on_objective_body_entered(_body) -> void:
    if not next_level is PackedScene: 
        hud.show_won()
    get_tree().change_scene_to_packed(next_level)

func _on_player_hit() -> void: 
    _retry() 
    

