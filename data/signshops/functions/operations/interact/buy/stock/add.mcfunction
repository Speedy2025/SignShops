## ADD STOCK FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - signshops:operations/interact/buy/stock/add_success
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Checks if the user's item is valid to stock with

## COMMANDS
data modify storage signshops:ops Item set from entity @e[tag=ss.temp.target,limit=1] data.Item.id
execute store result score @s ss.matches run data modify storage signshops:ops Item set from entity @s SelectedItem.id
execute unless data entity @s SelectedItem.id run scoreboard players set @s ss.matches 1
execute if score @s ss.matches matches 1 run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Invalid Item"}]

#Check if it's a damage-based item, those are OK(ish)
execute store result score @s ss.stock run data get entity @s SelectedItem.tag

execute if score @s ss.matches matches 0 if data entity @s SelectedItem.tag unless score @s ss.stock matches 1 run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Invalid Item - No Items with NBT Data"}]
execute if score @s ss.matches matches 0 if data entity @s SelectedItem.tag if score @s ss.stock matches 1 unless data entity @s SelectedItem.tag{Damage: 0} run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Invalid Item - No Items with NBT Data"}]

execute if score @s ss.matches matches 0 unless data entity @s SelectedItem.tag run function signshops:operations/interact/buy/stock/add_success
execute if score @s ss.matches matches 0 if data entity @s SelectedItem.tag if score @s ss.stock matches 1 if data entity @s SelectedItem.tag{Damage: 0} run function signshops:operations/interact/buy/stock/add_success
