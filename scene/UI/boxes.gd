extends HBoxContainer
@onready var lower_hud: Control = $"../.."
var box = preload("res://scene/UI/box.tscn")
var space = preload("res://scene/UI/space.tscn")
var children_array:Array
var shownLabels:Array
#
#var previousLabelIndex:int = 0
#var currentLableIndex:int = 1
var recursionCount:int


func _ready() -> void:
	BattleTracker.replaceBoxes.connect(replaceBoxes)
	BattleTracker.playerTakeDmg.connect(showHint)
	
func replaceBoxes():
	children_array.clear()
	for child in get_children():
		child.queue_free()

func answerBoxes():
	var letters = lower_hud.answer.split()
	for letter in letters:
		var instance = box.instantiate()
		var label = instance.get_node("MarginContainer/Label")
		label.text = letter.to_upper()
		label.hide()
		add_child(instance)
		#print(letter)

func showHint():
	children_array = get_children()
	var random_index = randi_range(0,children_array.size() - 1)
	#previousLabelIndex = currentLableIndex 
	#currentLableIndex = random_index
	
	
	if children_array.size() > 0:
		print("Working")
		var randomNode = children_array[random_index]
		var label = randomNode.get_node("MarginContainer/Label")
		
		if label.is_visible() and not recursionCount == children_array.size() + 1:
			recursionCount = recursionCount + 1
			showHint()
		elif not label.is_visible():
			label.show()
			recursionCount = 0
			



		#shownLabels.append(random_index)
		#print(children_array.size())
		#print("index" + str(random_index))
		
