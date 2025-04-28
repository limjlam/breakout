extends Node

@export var lives = 3
var score = 0

@onready var lives_label: Label = $Lives
@onready var score_label: Label = $Score
@onready var game_over_label: Label = $GameOver
@onready var high_score_label: Label = $HighScore

func _ready() -> void:
	var high_score:int = Global.save_data.high_score
	high_score_label.text = "High Score: " + str(high_score)

func deduct_life():
	lives -= 1
	lives_label.text = "Lives: " + str(lives)
	if lives == 0:
		game_over(score)

func add_points():
	score += 100
	score_label.text = "Score: " + str(score)

func game_over(score:int):
	#get_tree().paused = true
	game_over_label.text = "GAME OVER! \nScore: " + str(score)
	game_over_label.visible = true
	if score > Global.save_data.high_score:
		Global.save_data.high_score = score
