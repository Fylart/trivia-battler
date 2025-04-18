extends Control


var questionSet1:Dictionary = {
	"San binaril si rizal?":"likod",
	"Where did rizal studied?":"School",
	"Sino ang unang pangulo ng Pilipinas?":"Emilio Aguinaldo",
	"Saan binaril si Dr.Jose Rizal":"Luneta Park",
	"Saan ipinanganak si Dr.Jose Rizal??":"Calamba",
	"Ano ang Pambansang bulaklak ng Pilipinas?":"Sampaguita",
	"Anong pambansang ibon ng Pilipinas?":"Agila",
	"Ano ang tawag sa pambansang wika ng Pilipinas?":"Filipino",
	"Ano ang tawag sa pambansang laro ng Pilipinas?":"Sipa",
	"Ano ang tawag sa pambansang puno ng Pilipinas?":"Narra",
	"Ano ang tawag sa pambansang awit ng Pilipinas?":"Lupang Hinirang",
	"Ano ang tawag sa salitang kilos?":"Pandiwa",
	"Anong bahagi ng pananalita ang nagsasaad ng lugar, panahon, o paraan?":"Pang Abay",
	"Anong uri ng pangungusap ang nagpapahayag ng damdamin?":"Padamdam",
	"Ano ang tawag sa pinakamaliit na yunit ng salita?":"Pantig",
	"Anong bansa ang sumakop sa Pilipinas ng higit 300 taon?":"Espanya",
	"Sino ang sumulat ng Noli Me Tangere":"Jose Rizal",
	"Sino ang tinaguriang Ama ng Katipunan?":"Andres Bonifacio",
	"Ano ang tawag sa mga salitang magkasalungat?":"Kasalungat",
	"Ano ang tawag sa matalinghagang pahayag na di tuwirang kahulugan?":"Idyoma",
	"Anong wika ang itinuturing na pambansang wika ng Pilipinas?":"Filipino",
	"Anong uri ng sanaysay ang naglalahad ng impormasyon?":"Pormal",
	"Ano ang tawag sa pagpapahayag ng opinyon sa isang paksa?":"Pagsusuri",
	"Anong bahagi ng pananalita ang naglalarawan sa pangngalan?":"Pang uri",
	"Anong bahagi ng pananalita ang nagpapakita ng kilos?":"Pandiwa",
	"Ano ang tawag sa lipon ng mga salitang walang buong diwa?":"Parirala",
	"Anong bahagi ng kwento ang nagpapakita ng solusyon sa problema?":"Wakas",
	"Anong uri ng pangungusap ang may isang diwa lamang?":"Payak",
	"Anong bahagi ng pananalita ang humahalili sa pangngalan?":"Panghalip",
	"Ano ang tawag sa panitikang may tauhan, tagpuan, at banghay?":"Maikling Kwento",
	"Anong bahagi ng sanaysay ang nagpapaliwanag ng ideya?":"Katawan",
	"Ano ang tawag sa sanaysay na naglalahad ng damdamin o opinyon?":"Di Pormal",
	"Ano ang tawag sa maikling kasabihang may aral?":"Salawikain",
	"Ano ang tawag sa pahayag na may malalim na kahulugan at simbolismo?":"Tayutay",
	"Ano ang tawag sa masining na pagpapahayag ng ideya?":"Retorika",
	"Anong uri ng pamahalaan ang ipinatupad ni Ferdinand Marcos noong 1972?":"Batas Militar",
	"Anong lungsod ang naging sentro ng mga digmaan sa Pilipinas noong 1945?":"Manila",
	"Sino ang itinuturing na unang bayani ng Pilipinas?":"Lapu-Lapu",
	"Anong kulay nang saging":"Dilaw",
	"Ano ang tawag sa lihim na samahang itinatag ni Bonifacio?":"Katipunan",
	"Ano ang tawag sa pambansang kasuotan ng mga lalaki sa Pilipinas?":"Barong Tagalog"
}


var questionsKey

@onready var boxes: HBoxContainer = $VBoxContainer/boxes
@onready var question: Label = $VBoxContainer/question
var questionKey:String
var answer:String

@onready var gameOver:PackedScene = preload("res://scene/UI/gameOver.tscn")

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
		var instance = gameOver.instantiate()
		get_parent().add_child(instance)
		get_tree().paused = true
		
