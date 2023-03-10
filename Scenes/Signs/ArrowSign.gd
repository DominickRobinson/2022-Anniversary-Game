extends Node2D

export (String, "up", "down", "left", "right") var direction := "right"

func _ready():
	$AnimationPlayer.play(direction)
