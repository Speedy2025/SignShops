## BUY FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Attempts to BUY

## COMMANDS

#Reduce stock
execute store result score @s ss.stock run data get entity @e[tag=ss.temp.target,limit=1] data.Item.Count
scoreboard players operation @e[tag=ss.temp.target,limit=1] ss.stock -= @s ss.stock

#Update Stock
execute if score @e[tag=ss.temp.target,limit=1] ss.stock < @s ss.stock run data modify block ~ ~ ~ Text1 set value '{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'

#Reduce Currency
scoreboard players operation @s ss.currency -= @e[tag=ss.temp.target,limit=1] ss.currency

#Update Currency
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run scoreboard players operation $in.uid rx.pdb.io = @e[tag=ss.temp.target,limit=1] ss.interact
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run function #rx.playerdb:api/v2/get
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 store result score @s ss.stock run data get storage rx:io player.data.signshops.collect.currency
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 store result storage rx:io player.data.signshops.collect.currency int 1 run scoreboard players operation @s ss.stock += @e[tag=ss.temp.target,limit=1] ss.currency
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run function #rx.playerdb:api/v2/save

#Give Items
execute in minecraft:overworld run data modify block 29999984 0 43377 Items[] set from entity @e[tag=ss.temp.target,limit=1] data.Item
execute in minecraft:overworld store result score #success ss.matches run loot give @s mine 29999984 0 43377 air{drop_contents:1b}
execute positioned as @s if score #success ss.matches matches 0 run function signshops:operations/interact/buy/success_backup