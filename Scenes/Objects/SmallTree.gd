extends Node2D

export (String, "spring_pointy", "spring_dome", "spring_round",
				"winter_pointy", "winter_dome", "winter_round",
				"orange_pointy", "orange_dome", "orange_round",
				"red_pointy", "red_dome", "red_round",
				"palm_tree", "coconut_tree") var tree_animation := "spring_pointy"


func _ready():
	$AnimationPlayer.play(tree_animation)
