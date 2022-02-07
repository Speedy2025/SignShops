## VALID SELL SIGN FUNCTION
# Context: None
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/init/sell/verify/root
# Description:
#   <> Finishes initializing the sell sign

## COMMANDS
execute if score @s ss.interact matches 0.. run data modify block ~ ~ ~ Text1 set value '{"text":"[Sell]","color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'
execute if score @s ss.interact matches -1 run data modify block ~ ~ ~ Text1 set value '{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'
tag @s add ss.sell
scoreboard players operation @s ss.currency = #priceF ss.matches
scoreboard players set @s ss.stock 0