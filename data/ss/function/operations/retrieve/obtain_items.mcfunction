
execute store result score #count ss.stock run data get storage ss:temp val.Collection.Items[0].count
execute if score #count ss.stock matches 0 run data remove storage ss:temp val.Collection.Items[0]
execute if score #count ss.stock matches 0 run return 0

execute in overworld run item replace block 0 -64 0 container.0 with minecraft:wooden_pickaxe
execute in overworld run data modify block 0 -64 0 Items[{Slot: 0b}].id set from storage ss:temp val.Collection.Items[0].id
execute in overworld run data modify block 0 -64 0 Items[{Slot: 0b}].components set from storage ss:temp val.Collection.Items[0].components
scoreboard players set #continue ss.stock 1
execute store result score #continue ss.stock run function ss:operations/retrieve/drop_item
execute if score #continue ss.stock matches 1.. unless data storage ss:temp val.Collection.Items[] run scoreboard players set #continue ss.stock 0
execute if score #continue ss.stock matches 1.. run return run function ss:operations/retrieve/obtain_items
# Now, we try to drop it.