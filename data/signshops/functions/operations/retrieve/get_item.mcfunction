## GET ITEM FUNCTION
# Context: Player
# Calls:
#   - signshops:operations/retrieve/get_item
# Called by:
#   - signshops:operations/retrieve/root
# Description:
#   <> Loops giving you the item

## COMMANDS
#Give item - Includes protective measure
execute in minecraft:overworld run data modify block 29999984 0 43378 Items[] set from storage rx:io player.data.signshops.collect.Items[-1]
execute in minecraft:overworld store result score #success ss.matches run loot give @s mine 29999984 0 43378 air{drop_contents:1b}
execute if score #success ss.matches matches 1.. run data remove storage rx:io player.data.signshops.collect.Items[-1]

#Update Counters
scoreboard players remove @s ss.retrieve 1
execute store result score #length ss.retrieve run data get storage rx:io player.data.signshops.collect.Items
#tellraw @a ["@S-",{"score":{"name":"@s","objective":"ss.retrieve"}},{"text":" #L-"},{"score":{"name":"#length","objective":"ss.retrieve"}},{"text":" #S-"},{"score":{"name":"#success","objective":"ss.matches"}}]
execute if score @s ss.retrieve matches 1.. if score #length ss.retrieve matches 1.. if score #success ss.matches matches 1.. run function signshops:operations/retrieve/get_item