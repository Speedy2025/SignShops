## BALANCE FUNCTION
# Context: Player
# Calls:
#   - None
# Called by:
#   - signshops:main/tick
# Description:
#   <> Used to query balance

## COMMANDS

tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Your balance is "},{"text":"$","color":"gold"},{"score":{"name":"@s","objective":"ss.currency"},"color":"gold"}]
function #rx.playerdb:api/v2/get/self
execute store result score #length ss.retrieve run data get storage rx:io player.data.signshops.collect.Items
execute store result score #balance ss.retrieve run data get storage rx:io player.data.signshops.collect.currency
execute if score #length ss.retrieve matches 1.. run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"You have "},{"score":{"name":"#length","objective":"ss.retrieve"},"color":"gold"},{"text":" set(s)","color":"gold"},{"text":" of items to retrieve! Run "},{"text":"/trigger ss.retrieve set ","color":"gold"},{"score":{"name":"#length","objective":"ss.retrieve"},"color":"gold"}]
execute unless score #length ss.retrieve matches 1.. if score #balance ss.retrieve matches 1.. run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"You have some money to retrieve! Run "},{"text":"/trigger ss.retrieve set 1","color":"gold"}]