extends Label

@onready var lower_hud: Control = $"../../../.."

func _ready() -> void:
	text = lower_hud.questionKey
