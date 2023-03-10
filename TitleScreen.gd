extends Control

onready var LevelSelect = $Control/LevelSelect

var levels = ["res://Levels/Intro.tscn",
"res://Levels/1 - 2021 Anniversary.tscn",
"res://Levels/2 - CMU (fall).tscn","res://Levels/3 - Zoo festival.tscn",
"res://Levels/4 - Halloween.tscn",
"res://Levels/5 - Turkey Trot.tscn",
"res://Levels/6 - Winter.tscn",
"res://Levels/7 - CMU (winter spring).tscn",
"res://Levels/8 - Summer.tscn",
"res://Levels/9 - Flower picking.tscn",
"res://Levels/A - Beach.tscn",
"res://Levels/B - 2022 Anniversary.tscn",
"res://Levels/C - Home.tscn",
"res://Levels/D - Pickleball.tscn"]


func _on_Button_pressed():
	LevelManager.current_level = LevelSelect.value
	get_tree().change_scene(LevelManager.get_level())
