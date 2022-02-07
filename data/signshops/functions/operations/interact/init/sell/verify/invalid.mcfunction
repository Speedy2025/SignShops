## INVALID sell SIGN FUNCTION
# Context: None
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/init/sell/verify/root
# Description:
#   <> Inform user and abort initialization

## COMMANDS
execute at @e[tag=ss.target] run data modify block ~ ~ ~ Text1 set value '{"text":"[Sell]","color":"dark_red"}'
execute at @e[tag=ss.target] run data modify block ~ ~ ~ Text2 set value '{"text":"Invalid Price","color":"red"}'
execute at @e[tag=ss.target] run data modify block ~ ~ ~ Text3 set value '{"text":"Try $1 or $2025","color":"red"}'
scoreboard players set #failed ss.matches 1
tellraw @a[tag=ss.owner] ["",{"text":"[SignShops] ","color":"green"},{"text":"Invalid Price, requires whole price amount with dollar sign and no decimals/commas. (EX: $5 or $999)"}]
scoreboard players set #priceF ss.matches 0
kill @e[type=marker,tag=ss.target]