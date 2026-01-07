execute unless data entity @s SelectedItem.components."minecraft:custom_data".entity.id run return run function ss:operations/registration/sign/initiate/generic_item

function ss:operations/registration/sign/initiate/specific/max_quantity
execute store result score #amount ss.raycast run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.amount
execute if score #amount ss.raycast > #max ss.raycast if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell"} store result storage ss:temp assign.quantity int 1 run scoreboard players get #max ss.raycast
execute if score #amount ss.raycast > #max ss.raycast if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell"} run function ss:operations/registration/sign/validate/quantity with storage ss:temp assign


data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components set from entity @s SelectedItem.components
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id set from entity @s SelectedItem.id
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner set from entity @s UUID
execute if entity @s[tag=ss.adminshop] run tag @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] add ss.adminshop
execute if entity @s[tag=ss.adminshop] run data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock set value -1

execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: -1} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Buy]",color:"dark_blue",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: -1} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Sell]",color:"dark_blue",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: 0} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Buy]",color:"red",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: 0} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Sell]",color:"red",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: 0} run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Shop created. When ready, please stock it by right clicking while holding the item."}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: 0} run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Shop created. When ready, please stock it by right clicking while holding the item."}]
execute if entity @s[tag=ss.adminshop] run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Adminshop created."}]

data modify storage ss:temp assign.extra set value "spawner"
data modify storage ss:temp assign.alt_name set from entity @s SelectedItem.components."minecraft:custom_data".entity.id
execute store result storage ss:temp assign.len int 1 run data get storage ss:temp assign.alt_name
function ss:operations/registration/sign/initiate/specific/spawner_mob with storage ss:temp assign
return run function ss:operations/registration/sign/initiate/specific/spawner_final with storage ss:temp assign