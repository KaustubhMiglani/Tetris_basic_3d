extends GridMap

var columns
var rows
var objects=[load("res://Basic_cube/Block_I.tscn")]
func _ready():
	pass
func _process(delta):
	for y in range(-11,0):
		var poss=1
		for i in range(-5,5):
			for j in range(-1,1):
				if(get_cell_item(i,y,j)==-1):
					poss=0
					break 
		if(poss==1):
			get_node("../..").update_score()
			for i in range(-5,5):
				for j in range(-1,1):					
					get_tree().call_group("Tetris_piece","set_invisible",get_cell_item(i,y,j))
					set_cell_item(i,y,j,-1)
func is_node_valid(position,current):
	if(position.x<-5):
		return false
	if(position.x>=5):
		return false
	if(position.y>5):
		return false
	if(position.y<-10):
		return false
	if(position.z<-1):
		return false
	if(position.z>=1):
		return false
	if(get_cell_item(position.x,position.y,position.z)==INVALID_CELL_ITEM):
		return true
	if(abs(get_cell_item(position.x,position.y,position.z)-8*current)>=4):
		return false 
	return true
func set_position(position,which):
	set_cell_item(position.x,position.y,position.z,which)
