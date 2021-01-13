extends Node

onready var Game = get_node('/root/Game/')

var deck = Array() 
var cardBack = preload("res://assets/cards/cardBack_black.png")

func _ready():
	fillDeck()
	dealDeck()
	

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
