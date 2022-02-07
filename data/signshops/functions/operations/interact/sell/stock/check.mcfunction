## Check STOCK FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Attempts to CHECK stock

## COMMANDS
execute if score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"The shop has: "},{"text":"$∞","color":"gold"}]
execute if score @e[tag=ss.temp.target,limit=1] ss.interact matches 0.. run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"The shop has: "},{"text":"$","color":"gold"},{"score":{"name":"@e[tag=ss.temp.target,limit=1]","objective":"ss.stock"},"color":"gold"}]
execute if score @s rx.uid = @e[tag=ss.temp.target,limit=1] ss.interact run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Manage Stock: "},{"text":"(Remove Set)","clickEvent":{"action":"run_command","value":"/trigger ss.interact set -1"},"color":"dark_aqua"},{"text":" "},{"text":"(Remove All)","clickEvent":{"action":"run_command","value":"/trigger ss.interact set -2"},"color":"dark_aqua"}]