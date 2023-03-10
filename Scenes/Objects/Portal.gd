extends Node2D

export var forward := true

var ready = false

func _ready():
	if forward:
		modulate = Color(0,1,0,1)
	else:
		modulate = Color(1,1,1,1)
	
	yield(get_tree().create_timer(3.0), "timeout")
	ready = true


func _on_Area2D_body_entered(body):
	if not ready:
		return
		
	if body.is_in_group("Player"):
		if forward:
			LevelManager.go_to_next_level()
		else:
			LevelManager.go_to_prev_level()
