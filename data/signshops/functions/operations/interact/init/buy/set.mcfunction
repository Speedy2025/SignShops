## STEP SET BUY SIGN FUNCTION
# Context: Player w/ Item @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/init/root
# Description:
#   <> Sets the item to buy (DOES NOT STOCK)

## COMMANDS

#I want to store two things:
# Item Name (ex: minecraft:apple)
# Enchantments (ex: sharpness V)

# First, summon the marker & identifiers
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["ss.marker","ss.target"]}
tag @s add ss.owner

# Next, set its item
data modify entity @e[tag=ss.target,limit=1] data.Item.id set from entity @s SelectedItem.id
data modify entity @e[tag=ss.target,limit=1] data.Item.Count set from entity @s SelectedItem.Count
data modify entity @e[tag=ss.target,limit=1] data.Item.tag.Enchantments set from entity @s SelectedItem.tag.Enchantments

#Display the item its set to
data modify block ~ ~ ~ Text2 set value '{"nbt":"SelectedItem.id","entity":"@a[tag=ss.owner,limit=1]"}'
execute store result score #price6 ss.matches run data get entity @s SelectedItem.Count
execute if score #price6 ss.matches matches 2.. run data modify block ~ ~ ~ Text3 set value '[{"score":{"name":"#price6","objective":"ss.matches"}},{"text":" items"}]'
execute if score #price6 ss.matches matches 1 run data modify block ~ ~ ~ Text3 set value '[{"score":{"name":"#price6","objective":"ss.matches"}},{"text":" item"}]'
# Finally, set the owner
# In case you aren't using PDI or the likes and you don't have an ID yet...
function #rx.playerdb:api/v2/get/self
execute unless entity @s[tag=ss.adminshop] run scoreboard players operation @e[tag=ss.target,limit=1] ss.interact = @s rx.uid
execute if entity @s[tag=ss.adminshop] run scoreboard players set @e[tag=ss.target,limit=1] ss.interact -1

# -[ Set Price ]-
# This requires string parsing


# QUANTITY

data modify storage suso.str:io in.string set from block ~ ~ ~ Text4
data modify storage suso.str:io in.prep set value '{"text":"'
data modify storage suso.str:io in.max_chars set value 11
function suso.str:charsets/ascii
data modify storage suso.str:io in.callback set value 'function signshops:operations/interact/init/buy/verify/root'
function suso.str:call