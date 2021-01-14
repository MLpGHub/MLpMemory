extends Node

onready var Game = get_node('/root/Game/')

var deck = Array() 
var cardBack = preload("res://assets/cards/cardBack_black.png")

var firstCard
var secoundCard

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
		while v<14:
			deck.append(Card.new(s,v))
			v= v+1
		s += 1
func dealDeck():
	var c = 0
	while c < deck.size():
		Game.get_node('CardGrid').add_child(deck[c])
		c += 1
		
func chooseCard(var c):
	if firstCard == null:
		firstCard = c
		firstCard.flip()
		firstCard.set_disabled(true)
	elif secoundCard == null:
		secoundCard = c
		secoundCard.flip()
		secoundCard.set_disabled(true)
		checkCards()
	
func checkCards():
	if firstCard.cardValue == secoundCard.cardValue:
		matchTimer.start(0.6)
	else:
		flipTimer.start(0.6)
		#turnOverCards()
	
func turnOverCards():
	firstCard.flip()
	secoundCard.flip()
	firstCard.set_disabled(false)
	secoundCard.set_disabled(false)
	firstCard = null
	secoundCard = null
	
func matchCardsAndScore():
	score += 1
	firstCard.set_modulate(Color(0.6,0.6,0.6,0.5))
	secoundCard.set_modulate(Color(0.6,0.6,0.6,0.5))
	firstCard = null
	secoundCard = null
	print(score)
	
	
