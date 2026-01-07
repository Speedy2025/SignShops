
# We know who the owner is.
# Check if their item matches...

execute unless data entity @s SelectedItem run return fail
data modify storage ss:temp verify set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id
execute store result score #item_ok ss.raycast run data modify storage ss:temp verify set from entity @s SelectedItem.id
execute if score #item_ok ss.raycast matches 1.. run return fail

execute if data entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components run scoreboard players set #item_components ss.raycast 1
execute if score #item_components ss.raycast matches 1 run data modify storage ss:temp verify set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components
execute if score #item_components ss.raycast matches 1 run execute store result score #item_ok ss.raycast run data modify storage ss:temp verify set from entity @s SelectedItem.components
execute if score #item_components ss.raycast matches 1 run execute if score #item_ok ss.raycast matches 1.. run return fail


execute store result score #item_count ss.raycast run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock
execute store result score #held_count ss.raycast run data get entity @s SelectedItem.count
scoreboard players operation #item_count ss.raycast += #held_count ss.raycast
execute store result entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock int 1 run scoreboard players get #item_count ss.raycast
item replace entity @s weapon.mainhand with minecraft:air

tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Stocked the shop. Stock: "},{score:{name:"#item_count",objective:"ss.raycast"},color:"gold"}]

function ss:operations/update_sign/start