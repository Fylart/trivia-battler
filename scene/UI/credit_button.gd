extends TextureButton

var credit:PackedScene = preload("res://scene/UI/credit.tscn")

func _on_pressed() -> void:
	var instance = credit.instantiate()
	get_parent().get_parent().add_child(instance)
