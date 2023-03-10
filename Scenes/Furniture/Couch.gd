extends Node2D

export (String, "red", "blue", "green") var color := "red"

func _ready():
	$AnimationPlayer.play(color)
