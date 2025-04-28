extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_axis("left", "right")
	velocity = Vector2(input_direction * speed, 0)
	

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
