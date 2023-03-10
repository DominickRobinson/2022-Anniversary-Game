extends Node2D

export (String, "study_desk", "study_desk_with_laptop",
				"study_desk_with_lamp", "class_desk",
				"class_desk_with_laptop", "class_desk_with_paper",
				"long_short", "long_tall", "GCS_winner") var variation := "study_desk"


func _ready():
	$AnimationPlayer.play(variation)
