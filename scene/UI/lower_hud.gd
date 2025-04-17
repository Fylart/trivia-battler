extends Control


var questionSet1:Dictionary ={
	"San binaril si rizal?":"likod",
	"San binaril si rizal1?":"likod",
	"San binaril si rizal2?":"likod",
	"San binaril si rizal3?":"likod",
	"San binaril si rizal4?":"likod",
	"San binaril si rizal5?":"likod",
	"San binaril si rizal6?":"likod",
	"San binaril si rizal7?":"likod",
	"Where did rizal studied?":"School"
}


var questionsKey

@onready var boxes: HBoxContainer = $VBoxContainer/boxes
@onready var question: Label = $VBoxContainer/question
var questionKey:String
var answer:String

func _ready() -> void:
	reRollQuestion()

func reRollQuestion():
	print(questionSet1.size())
	if not questionSet1.is_empty():
		questionsKey = questionSet1.keys()
		questionKey = questionsKey[randi_range(0,questionsKey.size() - 1)]
		answer = questionSet1[questionKey]
		BattleTracker.replaceBoxes.emit()
		boxes.answerBoxes()
		question.text = questionKey
	else:
		get_tree().quit()
		
