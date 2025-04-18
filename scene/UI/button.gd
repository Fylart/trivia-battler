extends Button
@onready var menu = preload("res://scene/UI/menu.tscn")

func _on_pressed() -> void:
	var instance = menu.instantiate()
	get_parent().get_parent().add_child(instance)
	print("Pressed")
	get_tree().set_pause(true)
