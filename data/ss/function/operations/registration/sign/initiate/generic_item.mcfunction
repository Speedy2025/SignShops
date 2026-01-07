
# Filter out bad items
scoreboard players set #refuse ss.raycast 0
execute store result score #refuse ss.raycast run data get entity @s SelectedItem.components{"minecraft:unbreakable": {}}
execute if score #refuse ss.raycast matches 1.. run return run tellraw @s ["",{text:"[SignShops]",color:"green"},{text:" You cannot sell "},{text:"unbreakable items",color:"gold"},"."]
execute store result score #refuse ss.raycast run data get entity @s SelectedItem.components."minecraft:custom_name"
execute store result score #refuse ss.raycast run data get entity @s SelectedItem.components."minecraft:custom_data"."tse:disable_enchants"
execute if score #refuse ss.raycast matches 1.. run return run tellraw @s ["",{text:"[SignShops]",color:"green"},{text:" You cannot sell "},{text:"forbidden items",color:"gold"},"."]

function ss:operations/registration/sign/initiate/specific/max_quantity
execute store result score #amount ss.raycast run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.amount=
execute if score #amount ss.raycast > #max ss.raycast if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell"} store result storage ss:temp assign.quantity int 1 run scoreboard players get #max ss.raycast
execute if score #amount ss.raycast > #max ss.raycast if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell"} run function ss:operations/registration/sign/validate/quantity with storage ss:temp assign

data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id set from entity @s SelectedItem.id
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner set from entity @s UUID
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components set from entity @s SelectedItem.components
execute if entity @s[tag=ss.adminshop] run tag @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] add ss.adminshop
execute if entity @s[tag=ss.adminshop] run data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock set value -1

data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.ready set value true

execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: -1} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Buy]",color:"dark_blue",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: -1} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Sell]",color:"dark_blue",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: 0} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Buy]",color:"red",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: 0} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Sell]",color:"red",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: 0} run tellraw @s ["",{text:"[SignShops]",color:"green"},{text:" Shop created. When ready, please stock it by right clicking while holding the item."}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: 0} run tellraw @s ["",{text:"[SignShops]",color:"green"},{text:" Shop created. When ready, please stock it by right clicking while holding the item."}]
execute if entity @s[tag=ss.adminshop] run tellraw @s ["",{text:"[SignShops]",color:"green"},{text:" Adminshop created."}]
# We will assume an unmodded environment.
execute store result storage ss:temp assign.len int 1 run data get entity @s SelectedItem.id
return run function ss:operations/registration/sign/initiate/generic_item_final with storage ss:temp assign