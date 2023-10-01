extends RigidBody2D

signal hit 

@export var speed := 50.0
@export var angular_speed := 100.0

@onready var main_thruster_animation = $MainThrusterAnimation
@onready var main_thruster_fire = $MainThrusterFire
@onready var top_thruster_animation = $TopThrusterAnimation
@onready var top_thruster_fire = $TopThrusterFire
@onready var bottom_thruster_animation = $BottomThrusterAnimation
@onready var bottom_thruster_fire = $BottomThrusterFire

func _physics_process(delta: float) -> void:
    if Input.is_action_pressed("right"):
        main_thruster_fire.visible = true
        main_thruster_animation.play("main_thruster_fire")
        apply_central_impulse(Vector2(sin(rotation + PI / 2), -cos(rotation + PI / 2)) * speed *  delta)
    else: 
        main_thruster_fire.visible = false 
        main_thruster_animation.stop()
#    if Input.is_action_pressed("left"):
#        apply_central_impulse(Vector2(sin(rotation - PI / 2), -cos(rotation - PI / 2)) * speed * delta)
    if Input.is_action_pressed("down"):
        top_thruster_fire.visible = true
        top_thruster_animation.play("top_thruster_fire")
        apply_central_impulse(Vector2(-sin(rotation), cos(rotation)) * speed * delta)
    else:
        top_thruster_fire.visible = false 
        top_thruster_animation.stop() 
    if Input.is_action_pressed("up"):
        bottom_thruster_fire.visible = true
        bottom_thruster_animation.play("bottom_thruster_fire")
        apply_central_impulse(Vector2(sin(rotation), -cos(rotation)) * speed * delta)
    else: 
        bottom_thruster_fire.visible = false
        bottom_thruster_animation.stop()
    if Input.is_action_pressed("clockwise"):
        apply_torque_impulse(angular_speed * delta)
    if Input.is_action_pressed("counterclockwise"):
        apply_torque_impulse(-angular_speed * delta)

func _on_hurtbox_area_entered(_area):
    hit.emit() 
