## Remove STOCK FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Attempts to REMOVE stock

scoreboard players operation @s ss.currency += @e[tag=ss.temp.target,limit=1] ss.stock
scoreboard players set @e[tag=ss.temp.target,limit=1] ss.stock 0
data modify block ~ ~ ~ Text1 set value '{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'

tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Removed all balance from stock."}]