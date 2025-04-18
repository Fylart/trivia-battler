extends Node
@onready var health_ui: ProgressBar = $"../healthUI"
@export var damage:int
var scorePoints = 500


func _ready() -> void:
	damage = 10
	BattleTracker.playerTakeDmg.connect(takeDmg)
	return
	
func takeDmg():
	health_ui.value = health_ui.value - damage
	if health_ui.value <= 0:
		get_parent().queue_free()
