## SignShops Stage 2 - Unusual Initiation
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/specific/unusual_name
# Called by:
#   - ss:operations/registration/sign/initiate/specific/ebook
# Returns:
#   1 - failure
#   <None> - success
# Description:
#   <> Starts the processing chain for unusual books.

## Commands

# Fix the quantity
function ss:operations/registration/sign/initiate/specific/max_quantity
execute store result score #amount ss.raycast run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.amount
execute if score #amount ss.raycast > #max ss.raycast if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell"} store result storage ss:temp assign.quantity int 1 run scoreboard players get #max ss.raycast
execute if score #amount ss.raycast > #max ss.raycast if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell"} run function ss:operations/registration/sign/validate/quantity with storage ss:temp assign

# Store book and owner information
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components set from entity @s SelectedItem.components
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id set from entity @s SelectedItem.id
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner set from entity @s UUID

# Apply adminshop, if applicable
execute if entity @s[tag=ss.adminshop] run tag @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] add ss.adminshop
execute if entity @s[tag=ss.adminshop] run data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock set value -1

# Modify sign to reflect stock
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: -1} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Buy]",color:"dark_blue",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: -1} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Sell]",color:"dark_blue",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: 0} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Buy]",color:"red",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: 0} run data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Sell]",color:"red",click_event:{action:"run_command",command:"/trigger ss.interact set -2"}}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "buy", stock: 0} run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Shop created. When ready, please stock it by right clicking while holding the item."}]
execute if data entity @e[type=marker, tag=ss.marker, distance=0..0.25,limit=1] data.ss{type: "sell", stock: 0} run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Shop created. When ready, please stock it by right clicking while holding the item."}]
execute if entity @s[tag=ss.adminshop] run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Adminshop created."}]

# Modify sign to display enchantment
data modify storage ss:temp assign.val set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components."minecraft:custom_data"."tse:unusual"
function ss:operations/registration/sign/initiate/specific/unusual_name with storage ss:temp assign