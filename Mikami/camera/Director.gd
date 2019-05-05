extends Node

var player
var cameras = []

func _ready():
	# Get a reference to the player
	player = get_parent().get_child(0)
	print(player.get_name())
	
	# Get a reference to all of the cameras owned by the director
	for node in get_children():
		if node is Camera:
			cameras.append(node)
	
	cameras.sort_custom(self, "player_distance_sort")
	
	for camera in cameras:
		print(camera.get_name())

func _process(delta):
	# Cut to the camera closest to the player
	cameras.sort_custom(self, "player_distance_sort")
	cameras[0].make_current()

func player_distance_sort(first, second):
	var first_position = first.get_camera_transform().origin
	var second_position = second.get_camera_transform().origin
	
	var first_distance = first_position.distance_to(player.get_global_transform().origin)
	var second_distance = second_position.distance_to(player.get_global_transform().origin)
	
	return first_distance < second_distance