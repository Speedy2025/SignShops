## BUY BACKUP FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Corrects failure to buy

summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:16},Tags:["ss.temp.item"]}
data modify entity @e[tag=ss.temp.item,limit=1] Owner set from entity @s UUID
data modify entity @e[tag=ss.temp.item,limit=1] Item set from entity @e[tag=ss.temp.target,limit=1] data.Item
tag @e remove ss.temp.item