extends Label
@onready var timer: Timer = $"../Timer"
@onready var gameOver:PackedScene = preload("res://scene/UI/gameOver.tscn")

func _ready() -> void:
	BattleTracker.addTime.connect(addTime)

func _process(_delta: float) -> void:
	text = str(int(timer.time_left))

func addTime():
	timer.wait_time = timer.get_wait_time() + 5
	timer.start()

func _on_timer_timeout() -> void:
	var instance = gameOver.instantiate()
	get_parent().get_parent().add_child(instance)
	get_tree().paused = true
