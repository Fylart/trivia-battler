extends LineEdit
@onready var lower_hud: Control = $"../.."

func _ready() -> void:
	grab_focus()
	return
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		accept_event()
		grab_focus()
	return

func _on_focus_exited() -> void:
	grab_focus()
	pass # Replace with function body.


func _on_text_submitted(playerInput: String) -> void:
	var answer:String = lower_hud.answer
	
	text = ""
	
	if answer.to_lower() == playerInput.to_lower():
		BattleTracker.enemyTakeDmg.emit()
		BattleTracker.addTime.emit()
		
		lower_hud.questionSet1.erase(lower_hud.questionKey)
		lower_hud.reRollQuestion()
	else:
		BattleTracker.playerTakeDmg.emit()
		return
