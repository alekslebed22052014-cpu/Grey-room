
extends Node3D

var room_script = preload("res://room.gd")

func _ready() -> void:
    var room = Node3D.new()
    room.name = "Room"
    room.set_script(room_script)
    add_child(room)

    var light := DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-45, -25, 0)
    light.light_energy = 0.7
    add_child(light)

    var camera := Camera3D.new()
    camera.position = Vector3(0, 1.7, 3.5)
    camera.rotation_degrees = Vector3(-5, 180, 0)
    camera.current = true
    add_child(camera)
