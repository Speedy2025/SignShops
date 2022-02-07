## RETRIEVE FUNCTION
# Context: Player
# Calls:
#   - signshops:operations/retrieve/getitem
# Called by:
#   - signshops:main/tick
# Description:
#   <> Used to acquire stuff

## COMMANDS

function #rx.playerdb:api/get/self

# The value of retrieve determines how many items it'll try to get, but it CAN be nonexistent, will account for

#Set currency
execute store result score #currency ss.retrieve run data get storage rx:io player.data.signshops.collect.currency
scoreboard players operation @s ss.currency += #currency ss.retrieve
data modify storage rx:io player.data.signshops.collect.currency set value 0
execute if score #currency ss.retrieve matches 1.. run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Added "},{"text":"$","color":"gold"},{"score":{"name":"#currency","objective":"ss.retrieve"},"color":"gold"},{"text":" to your balance."}]

#Loop Items
execute store result score #length ss.retrieve run data get storage rx:io player.data.signshops.collect.Items
execute if score #length ss.retrieve matches 1.. run function signshops:operations/retrieve/get_item
execute if score #length ss.retrieve matches 1.. run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Did not retrieve everything, there are still "},{"score":{"name":"#length","objective":"ss.retrieve"},"color":"gold"},{"text":" set(s)","color":"gold"},{"text":" of items remaining."}]
function #rx.playerdb:api/save/self