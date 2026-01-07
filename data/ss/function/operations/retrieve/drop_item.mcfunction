

execute in overworld store result score #success ss.stock run loot give @s mine 0 -64 0 stick[custom_data={drop_contents:1b}]
execute if score #success ss.stock matches 0 store result storage ss:temp val.Collection.Items[0].count int 1 run scoreboard players get #count ss.stock
execute if score #success ss.stock matches 0 if score #force_drop ss.stock matches 0 run return fail
execute if score #success ss.stock matches 0 if score #force_drop ss.stock matches 1 in overworld run loot spawn 0 -64 0 mine 0 -64 0 stick[custom_data={drop_contents:1b}]
execute if score #success ss.stock matches 0 if score #force_drop ss.stock matches 1 in overworld positioned 0 -64 0 run tp @e[type=item,distance=0..0.1] @s

#If we finished the item, we're done.
scoreboard players remove #count ss.stock 1
execute if score #count ss.stock matches ..0 run data remove storage ss:temp val.Collection.Items[0]
execute if score #count ss.stock matches ..0 run return 1
return run function ss:operations/retrieve/drop_item