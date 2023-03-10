extends Node2D

export (String, "tall_grey", "tall_red", "tall_blue", 
				"tall_green", "short_grey", "short_red",
				"short_blue", "short_green") var color := "tall_grey"

func _ready():
	$AnimationPlayer.play(color)
