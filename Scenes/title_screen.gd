extends Node2D

@onready var anim = $TitleScreenBackground/AnimationPlayer

func _ready():
	anim.play("TitleScreenAnimation")
