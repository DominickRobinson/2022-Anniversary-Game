extends Node2D


export (String, "red", "blue", "green") var color := "red"

onready var anim = $AnimationPlayer

func _ready():
	anim.play(str("small_", color, "_shroom"))
