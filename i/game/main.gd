extends Control

@export var colors: Array[Color]

var current_color_index: int = 0
var current_counter: int = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_next_background_color()
	
	var button: Button = get_node("Button")
	var _success: bool = button.pressed.connect(_on_button_pressed)
	button.grab_focus()


func _on_button_pressed() -> void:
	var countdown: Label = get_node("Countdown")
	countdown.visible = true
	current_counter -= 1
	var repetition: String = "time" if current_counter == 1 else str(current_counter) + " times"
	countdown.text = "another " + repetition
	_set_next_background_color()
	
	if current_counter == 0:
		var winning_overlay: ColorRect = get_node("WinningOverlay")
		winning_overlay.visible = true


func _set_next_background_color() -> void:
	var background: ColorRect = get_node("Background")
	current_color_index = (current_color_index + 1) % colors.size()
	background.color = colors[current_color_index]
