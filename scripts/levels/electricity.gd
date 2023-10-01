extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $Hitbox/CollisionShape2D
@onready var timer = $Timer

func _ready() -> void: 
    collision_shape_2d.disabled = true 
    sprite_2d.visible = false 

func _on_timer_timeout():
    sprite_2d.visible = true 
    animation_player.play("ready")
    await animation_player.animation_finished
    
    animation_player.play("active")
    collision_shape_2d.disabled = false 
    await get_tree().create_timer(2.0).timeout
    
    sprite_2d.visible = false 
    collision_shape_2d.disabled = true
    timer.start() 


