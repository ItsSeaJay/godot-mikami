extends Area

export(NodePath) var camera

onready var real_camera : Camera = get_node(camera) as Camera

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("player"):
		real_camera.make_current()