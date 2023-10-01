extends CanvasLayer

signal retry
signal return_to_menu

@onready var menu_button = $MenuButton
@onready var retry_button = $RetryButton
@onready var label = $Label

func _physics_process(delta):
    if Input.is_action_just_pressed("pause"): 
        if retry_button.is_visible_in_tree():
            get_tree().paused = false 
            retry_button.hide()
            menu_button.hide() 
        else:
            get_tree().paused = true
            retry_button.show() 
            menu_button.show()

func show_won():
    get_tree().paused = true
    menu_button.show()
    label.show()

func _on_retry_button_pressed():
    get_tree().paused = false
    retry_button.hide()
    retry.emit()
    
func _on_menu_button_pressed():
    get_tree().paused = false
    menu_button.hide()
    return_to_menu.emit()
