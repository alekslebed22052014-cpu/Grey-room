
extends Node3D

const ROOM_SIZE := Vector3(12.0, 4.0, 10.0)

func _ready() -> void:
    create_room()
    create_window()
    create_door()

func make_box(box_name: String, box_size: Vector3, box_position: Vector3, box_material: Material) -> MeshInstance3D:
    var item := MeshInstance3D.new()
    item.name = box_name
    var mesh := BoxMesh.new()
    mesh.size = box_size
    item.mesh = mesh
    item.position = box_position
    item.material_override = box_material
    add_child(item)
    return item

func make_material(color: Color, metallic: float = 0.0) -> StandardMaterial3D:
    var material := StandardMaterial3D.new()
    material.albedo_color = color
    material.metallic = metallic
    material.roughness = 0.75
    return material

func create_room() -> void:
    var concrete := make_material(Color(0.42, 0.43, 0.44))
    var dark := make_material(Color(0.055, 0.06, 0.065), 0.6)

    make_box("Floor", Vector3(12, 0.2, 10), Vector3(0, -0.1, 0), concrete)
    make_box("Ceiling", Vector3(12, 0.2, 10), Vector3(0, 4, 0), concrete)
    make_box("LeftWall", Vector3(0.2, 4, 10), Vector3(-6, 2, 0), concrete)
    make_box("RightWall", Vector3(0.2, 4, 10), Vector3(6, 2, 0), concrete)
    make_box("BackWall", Vector3(12, 4, 0.2), Vector3(0, 2, -5), concrete)

    var frame := make_box("WindowFrame", Vector3(7.5, 3.1, 0.25), Vector3(0, 2.25, -4.82), dark)
    var glass_material := make_material(Color(0.12, 0.19, 0.23))
    glass_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
    glass_material.albedo_color.a = 0.45
    make_box("HugeWindow", Vector3(7.1, 2.7, 0.08), Vector3(0, 2.25, -4.65), glass_material)

func create_window() -> void:
    var structure_material := make_material(Color(0.16, 0.17, 0.18), 0.8)
    for i in range(5):
        var x := -12.0 + float(i) * 6.0
        make_box("DistantStructure_%d" % i, Vector3(1.5, 9, 1.5), Vector3(x, 4.5, -24), structure_material)

func create_door() -> void:
    var dark := make_material(Color(0.035, 0.04, 0.045), 0.7)
    var white := make_material(Color(0.82, 0.83, 0.84), 0.55)

    make_box("DoorBlackFrame", Vector3(2.5, 3.4, 0.3), Vector3(0, 1.7, 4.8), dark)
    make_box("DoorLeft", Vector3(1.1, 3.2, 0.12), Vector3(-0.55, 1.7, 4.6), white)
    make_box("DoorRight", Vector3(1.1, 3.2, 0.12), Vector3(0.55, 1.7, 4.6), white)
