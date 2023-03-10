extends HBoxContainer


func _ready():
	visible = true
	
func _on_Restart_pressed():
	LevelManager.restart_level()
