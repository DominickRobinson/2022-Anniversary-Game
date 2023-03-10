extends Node


onready var LevelSelect = $Control/LevelSelect

var levels = ["res://Levels/0 - Intro.tscn",
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

var backgrounds = []
const bgResource = preload("res://Scenes/Background.tscn")

var current_level = 0

var current_character = "ALEXA"

func _ready():
	for n in levels.size():
		backgrounds.append(get_bg_texture(n))
	print(backgrounds)
	

func get_level():
	return levels[current_level]

func go_to_current_level():
	get_tree().change_scene(levels[current_level])

func go_to_next_level():
	current_level += 1
	if current_level >= levels.size():
		current_level = 0
	go_to_current_level()

func go_to_prev_level():
	current_level -= 1
	if current_level < 0:
		current_level = levels.size() - 1
	go_to_current_level()

func go_to_level(num):
	current_level = num
	get_tree().change_scene(num)

func restart_level():
	go_to_current_level()

func go_to_main_menu():
	get_tree().change_scene("res://TitleScreen.tscn")

func get_current_bg():
	return backgrounds[current_level]

func add_bg():
	var bg = bgResource.instance()
	get_tree().get_current_scene().add_child(bg)

func get_bg_texture(i):
	var bg_texture_path = "res://Assets/Backgrounds/" + str(i) + ".png"
	var bg_texture = load(bg_texture_path)
	return bg_texture



