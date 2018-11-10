extends Sprite


var status = "none"
var tsize=Vector2()
var mpos=Vector2()

enum {
	NONE
	CLICK
	
}
var state=NONE

func _ready():
      tsize=get_texture().get_size()
	
func _input(event):
	var rect=Rect2( position - tsize/2,tsize)
	var hit=rect.has_point(event.position)
	# Mouse in viewport coordinates
	if event is InputEventMouseButton and hit:
		if event.pressed:
				state=CLICK
		if not event.pressed:
			state=NONE
		print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion and hit:
       print("Mouse Motion at: ", event.position)
	
func _process(delta):
	if state==CLICK:
		position=get_viewport().get_mouse_position()

func compare(v1,v2):
	return 