extends TextureButton

class_name Card

var suit
var cardValue
var face
var cBack 

func _ready():
	pass

func _init(var sui, var val):
	suit = sui
	cardValue = val
	face = load("res://assets/cards/card-"+str(suit)+"-"+str(cardValue)+".png")	
	cBack = GameManager.cardBack
	set_normal_texture(face)
