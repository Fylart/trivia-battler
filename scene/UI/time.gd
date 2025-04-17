extends Label
@onready var timer: Timer = $"../Timer"

func _ready() -> void:
	BattleTracker.addTime.connect(addTime)

func _process(_delta: float) -> void:
	text = str(int(timer.time_left))

func addTime():
	timer.wait_time = timer.get_wait_time() + 5
	timer.start()
