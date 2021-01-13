extends Control


func _ready():
	var c = Card.new(1,1)
	$CardGrid.add_child(Card.new(1,5))
