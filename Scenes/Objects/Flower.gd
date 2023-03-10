extends Node2D

export (String, "spring_yellow", "spring_orange", "spring_red", 
				"spring_blue", "spring_pink", "winter_yellow", 
				"winter_orange", "winter_red", "winter_blue", 
				"winter_pink") var flower_anim := "spring_yellow"


func _ready():
	$AnimationPlayer.play(flower_anim)
