extends Camera

export(NodePath) var path_to_player

var player : KinematicBody

func _ready():
	player = get_node(path_to_player) as KinematicBody

func _process(delta):
	look_at(player.transform.origin, Vector3.UP)