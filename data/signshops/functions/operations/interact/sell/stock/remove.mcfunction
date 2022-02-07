## Remove STOCK FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Attempts to REMOVE stock

execute if score @e[tag=ss.temp.target,limit=1] ss.stock < @e[tag=ss.temp.target,limit=1] ss.currency run scoreboard players operation @s ss.currency += @e[tag=ss.temp.target,limit=1] ss.stock
execute if score @e[tag=ss.temp.target,limit=1] ss.stock < @e[tag=ss.temp.target,limit=1] ss.currency run scoreboard players set @e[tag=ss.temp.target,limit=1] ss.stock 0
execute if score @e[tag=ss.temp.target,limit=1] ss.stock >= @e[tag=ss.temp.target,limit=1] ss.currency run scoreboard players operation @s ss.currency += @e[tag=ss.temp.target,limit=1] ss.currency
execute if score @e[tag=ss.temp.target,limit=1] ss.stock >= @e[tag=ss.temp.target,limit=1] ss.currency run scoreboard players operation @e[tag=ss.temp.target,limit=1] ss.stock -= @e[tag=ss.temp.target,limit=1] ss.currency


execute if score @e[tag=ss.temp.target,limit=1] ss.stock < @e[tag=ss.temp.target,limit=1] ss.currency run data modify block ~ ~ ~ Text1 set value '{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'
tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Removed balance from stock. Stock Balance: "},{"text":"$","color":"gold"},{"score":{"name":"@e[tag=ss.temp.target,limit=1]","objective":"ss.stock"},"color":"gold"}]