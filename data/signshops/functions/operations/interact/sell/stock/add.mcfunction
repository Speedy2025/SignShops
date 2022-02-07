## ADD Stock FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - signshops:operations/interact/sell/success
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Adds stock if able

## COMMANDS

execute if score @s ss.currency >= @e[tag=ss.temp.target,limit=1] ss.currency run scoreboard players operation @e[tag=ss.temp.target,limit=1] ss.stock += @e[tag=ss.temp.target,limit=1] ss.currency
execute if score @s ss.currency >= @e[tag=ss.temp.target,limit=1] ss.currency run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Added to the shop's stock! Stock Balance: "},{"text":"$","color":"gold"},{"score":{"name":"@e[tag=ss.temp.target,limit=1]","objective":"ss.stock"},"color":"gold"}]
execute if score @s ss.currency >= @e[tag=ss.temp.target,limit=1] ss.currency run data modify block ~ ~ ~ Text1 set value '{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'
execute if score @s ss.currency < @e[tag=ss.temp.target,limit=1] ss.currency run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Insufficient funds to add"}]
execute if score @s ss.currency >= @e[tag=ss.temp.target,limit=1] ss.currency run scoreboard players operation @s ss.currency -= @e[tag=ss.temp.target,limit=1] ss.currency

