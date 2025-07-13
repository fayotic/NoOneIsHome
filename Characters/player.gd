extends CharacterBody2D

@export var move_speed : float = 200
#parameters/Idle/blend_position
@onready var animationTree = $AnimationTree
@onready var state_machine = animationTree.get("parameters/playback")

@export var starting_direction = Vector2(0,1)

func _ready():
	update_animation_parameter(starting_direction)
	
func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"),
		Input.get_action_strength("Down") - Input.get_action_strength("Up")
	)
	
	velocity = input_direction * move_speed
	update_animation_parameter(input_direction)
	move_and_slide()
	pick_new_state()
	
func update_animation_parameter(move_input: Vector2):
	if(move_input != Vector2.ZERO):
		animationTree.set("parameters/Idle/blend_position", move_input)
		animationTree.set("parameters/Walk/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
