extends Node2D

export (String, "red", "blue", "green") var color := "red"




func _ready():
	match color:
		"red":
			$Sprite.frame = 20
			$ColorRect.modulate = Color(1.5, 1.5, 1.5)
			$ColorRect.self_modulate = Color(5, 0, 0)
			$ColorRect.color = Color(5, 0, 0)
		"blue":
			$Sprite.frame = 21
			$ColorRect.modulate = Color(1.5, 1.5, 1.5)
			$ColorRect.self_modulate = Color(0, 0, 5)
			$ColorRect.color = Color(0, 0, 5)
		"green":
			$Sprite.frame = 22
			$ColorRect.modulate = Color(1.5, 1.5, 1.5)
			$ColorRect.self_modulate = Color(0, 5, 0)
			$ColorRect.color = Color(0, 5, 0)
