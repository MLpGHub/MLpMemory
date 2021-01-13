extends TextureButton

class_name Card

var suit
var cardValue
var cFace
var cBack 

func _ready():
	set_h_size_flags(3)
	set_v_size_flags(3)
	set_expand(true)
	set_stretch_mode(TextureButton.STRETCH_KEEP_ASPECT_CENTERED)
func _init(var sui, var val):
	suit = sui
	cardValue = val
	cFace = load("res://assets/cards/card-"+str(suit)+"-"+str(cardValue)+".png")	
	cBack = GameManager.cardBack
	set_normal_texture(cBack)
	
func _pressed():
	flip()

func flip():
	if get_normal_texture() == cBack:
		set_normal_texture(cFace)
	else:
		set_normal_texture(cBack)
