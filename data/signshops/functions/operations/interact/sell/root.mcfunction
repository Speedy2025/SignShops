## Sell Root FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - signshops:operations/interact/sell/success
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Checks if it can sell stuff

## COMMANDS

# Check if it is a valid item
data modify storage signshops:ops Items set value []
data modify storage signshops:ops Items set from entity @e[tag=ss.temp.target,limit=1] data.Item
execute store result score @s ss.interact run data modify storage signshops:ops Items.id set from entity @s SelectedItem.id

#Set aside failure
execute if score @s ss.interact matches 1 run scoreboard players set @s ss.interact -1

# Get hand & minimum stock
execute if score @s ss.interact matches 0 store result score @s ss.matches run data get storage signshops:ops Items.Count
execute if score @s ss.interact matches 0 store result score @s ss.interact run data get entity @s SelectedItem.Count

# Check Conditions (Valid Item, Hand > Min, Stock > Payment)
execute if score @s ss.interact matches -1 run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Unable to sell this item."}]
execute if score @s ss.interact < @s ss.matches run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Not enough items to sell"}]
execute if score @s ss.interact >= @s ss.matches run function signshops:operations/interact/sell/success

# Prevent Oopsies
scoreboard players set @s ss.interact 1