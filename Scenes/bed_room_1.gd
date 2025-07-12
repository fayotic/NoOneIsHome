extends Node2D

@onready var anim = $Teddy/AnimationPlayer


func _ready():
	anim.play("TeddyWalkLeft")
	anim.queue("TeddySitLeft")
