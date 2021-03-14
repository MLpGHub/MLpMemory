extends Node

onready var Game = get_node('/root/MLpMemory/')

var deck = Array()

var cardBack = preload("res://assets/cards/cardBack_red2.png")

var card1
var card2

var matchTimer = Timer.new()
var flipTimer = Timer.new()

var score = 0

func _ready():
	fillDeck()
	dealDeck()
	setupTimers()
	
func setupTimers():
	flipTimer.connect("timeout",self,"turnOverCards")
	flipTimer.set_one_shot(true)
	add_child(flipTimer)
	
	matchTimer.connect("timeout",self,"matchCardsAndScore")
	matchTimer.set_one_shot(true)
	add_child(matchTimer)

func fillDeck():
	#deck.append(Card.new(1,1))
	var s = 1
	var v = 1
	while s < 5:
		v = 1
		while v < 14:
			deck.append(Card.new(s,v))
			v = v + 1
		s += 1

func dealDeck():
	deck.shuffle()
	var c = 0
	while c < deck.size():
		Game.get_node('CardGrid').add_child(deck[c])
		c += 1

func chooseCard(var c):
	if card1 == null:
		card1 = c
		card1.flip()
		card1.set_disabled(true)
	elif card2 == null:
		card2 = c
		card2.flip()
		card2.set_disabled(true)
		checkCards()

func checkCards():
	if card1.value == card2.value:
		matchTimer.start(1)
	else:
		flipTimer.start(1)
		
func turnOverCards():
	card1.flip()
	card2.flip()
	card1.set_disabled(false)
	card2.set_disabled(false)
	card1 = null
	card2 = null

func matchCardsAndScore():
	score += 1
	card1.set_modulate(Color(0.6,0.6,0.6,0.5))
	card2.set_modulate(Color(0.6,0.6,0.6,0.5))
	card1 = null
	card2 = null
	print(score)
	








