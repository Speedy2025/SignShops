## Sell Success FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - signshops:operations/interact/sell/success
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Actually sells the item

## COMMANDS

# @s ss.interact -> # items to sell
# @s ss.matches  -> # items had

# The Lazy Way:tm:
# I'm just going to append the transaction to the collect list
# - This lets me do two things:
# - 1. Less overhead now & later (No worries about stack size, naturally done)
# - 2. Even less overhead now (No worries about pre-existing items, no need to loop or anything)
# Although it WILL be laggier when you collect, it's a single operation so not that bad I think
# </rant>

# Reward buyer the items
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run scoreboard players operation $in.uid rx.pdb.io = @e[tag=ss.temp.target,limit=1] ss.interact
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run function #rx.playerdb:api/v2/get
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run data modify storage rx:io player.data.signshops.collect.Items append from entity @e[tag=ss.temp.target,limit=1] data.Item
execute unless score @e[tag=ss.temp.target,limit=1] ss.interact matches -1 run function #rx.playerdb:api/v2/save

# Yoink seller items
data modify storage signshops:ops Items set from entity @s SelectedItem
execute store result storage signshops:ops Items.Count int 1 run scoreboard players operation @s ss.interact -= @s ss.matches
tellraw @a [{"score":{"name":"@s","objective":"ss.matches"}},{"text":" "},{"score":{"name":"@s","objective":"ss.interact"}}]
execute in minecraft:overworld run data modify block 29999984 0 43377 Items[] set from storage signshops:ops Items
execute in minecraft:overworld run loot replace entity @s weapon.mainhand 1 mine 29999984 0 43377 air{drop_contents:1b}

# Modify Currency
scoreboard players operation @e[tag=ss.temp.target,limit=1] ss.stock -= @e[tag=ss.temp.target,limit=1] ss.currency

# Reward seller currency
scoreboard players operation @s ss.currency += @e[tag=ss.temp.target,limit=1] ss.currency

# Update Sign
execute if score @e[tag=ss.temp.target,limit=1] ss.stock < @e[tag=ss.temp.target,limit=1] ss.currency run data modify block ~ ~ ~ Text1 set value '{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'
