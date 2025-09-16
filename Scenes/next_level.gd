extends Area2D
@onready var main_guy = %Main_Guy



func _on_body_entered(body):
	if body == main_guy:
		get_tree().change_scene_to_file("res://levels/tutorial_level_1.tscn")
