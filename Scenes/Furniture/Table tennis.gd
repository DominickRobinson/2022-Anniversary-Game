extends Node2D

export (String, "green", "blue") var color := "green"


func _ready():
	$AnimationPlayer.play(color)
