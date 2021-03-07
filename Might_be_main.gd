extends Spatial

var score=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var howmany=0
var objects=["res://Basic_cube/Block_I.tscn","res://Basic_cube/Block_T.tscn","res://Basic_cube/Block_S.tscn","res://Basic_cube/Block_O.tscn"]
func _ready():
	randomize()
	var x=load(objects[randi()%4])
	howmany+=1
	score+=1
	var type=x.instance()
	add_child(type)
	type.set_id(howmany)
	$Timer.start()
func _on_Timer_timeout():
	var x=load(objects[randi()%4])
	howmany+=1
	score+=1
	var type=x.instance()
	add_child(type)
	type.set_id(howmany)
	$Timer.start()
func update_score():
	score+=10
func _process(delta):
	($CanvasLayer/NinePatchRect/HBoxContainer/score).text="   Score   "+str(score)
