extends Sprite2D
@onready var common = "res://common.png"
@onready var legendary = "res://legendary.png"
@onready var display = $"../Sprite2D2"
@onready var pick_loot_table = []

#detects click on sprite
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			$AnimationPlayer.play("damage")
			pick_loot()

#each key is a loot and the value attached is its chance to drop
@onready var odds_table = {
	common: 9,
	legendary: 1
}
	

func _ready():
	for a in odds_table:
		var occ_count = 0
		while occ_count < odds_table[a]:
			pick_loot_table.push_back(a)
			occ_count += 1
	print(pick_loot_table)

func pick_loot():
	
	display.texture = load(pick_loot_table.pick_random())
