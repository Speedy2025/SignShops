## Remove STOCK FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Attempts to REMOVE some stock

## COMMANDS

#Get Stock
execute store result score @s ss.stock run data get entity @e[tag=ss.temp.target,limit=1] data.Item.Count

#Give Items
execute if score @e[tag=ss.temp.target,limit=1] ss.stock matches 1.. in minecraft:overworld run data modify block 29999984 0 43378 Items[] set from entity @e[tag=ss.temp.target,limit=1] data.Item
execute if score @e[tag=ss.temp.target,limit=1] ss.stock matches 1.. in minecraft:overworld if score @e[tag=ss.temp.target,limit=1] ss.stock < @s ss.stock store result block 29999984 0 43378 Items[0].Count int 1 run scoreboard players get @e[tag=ss.temp.target,limit=1] ss.stock
execute if score @e[tag=ss.temp.target,limit=1] ss.stock matches 1.. in minecraft:overworld store result score #success ss.matches run loot give @s mine 29999984 0 43378 air{drop_contents:1b}
execute if score @e[tag=ss.temp.target,limit=1] ss.stock matches 1.. if score #success ss.matches matches 0 at @s run function signshops:operations/interact/buy/stock/remove_backup

#Reduce Stock
execute if score @e[tag=ss.temp.target,limit=1] ss.stock < @s ss.stock run scoreboard players set @e[tag=ss.temp.target,limit=1] ss.stock 0
execute if score @e[tag=ss.temp.target,limit=1] ss.stock >= @s ss.stock run scoreboard players operation @e[tag=ss.temp.target,limit=1] ss.stock -= @s ss.stock

#Update Stock
execute if score @e[tag=ss.temp.target,limit=1] ss.stock < @s ss.stock run data modify block ~ ~ ~ Text1 set value '{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'
