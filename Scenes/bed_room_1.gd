extends Node2D

@onready var anim = $Teddy/AnimationPlayer
var resource = load("res://Dialogue/CutScene1Bedroom.dialogue")


func _ready():
	anim.play("TeddyWalkLeft")
	anim.queue("TeddySitLeft")
	DialogueManager.show_dialogue_balloon(resource, "start")

func transition():
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/bed_room_start.tscn")
