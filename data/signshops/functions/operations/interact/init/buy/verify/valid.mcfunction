## VALID BUY SIGN FUNCTION
# Context: None
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/init/buy/verify/root
# Description:
#   <> Finishes initializing the buy sign

## COMMANDS
execute if score @s ss.interact matches 0.. run data modify block ~ ~ ~ Text1 set value '{"text":"[Buy]","color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'
execute if score @s ss.interact matches -1 run data modify block ~ ~ ~ Text1 set value '{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'
tag @s add ss.buy
scoreboard players operation @s ss.currency = #priceF ss.matches
scoreboard players set @s ss.stock 0
