extends Control


var is_paused = false setget set_is_paused


func _ready():
	set_is_paused(false)
	get_parent().get_node("Buttons/Pause").visible = true


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_MainMenu_pressed():
	LevelManager.go_to_main_menu()
	self.is_paused = false

func _on_Resume_pressed():
	self.is_paused = false

func _on_PrevLevel_pressed():
	self.is_paused = false
	LevelManager.go_to_prev_level()
	
func _on_NextLevel_pressed():
	self.is_paused = false
	LevelManager.go_to_next_level()
	


func _on_Pause_pressed():
	self.is_paused = true
