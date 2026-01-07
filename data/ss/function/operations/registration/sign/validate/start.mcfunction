## SignShops Stage 1 - Validation
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/validate/quantity
#   - ss:operations/registration/sign/validate/price_stage
# Called by:
#   - ss:operations/registration/sign/buy
#   - ss:operations/registration/sign/sell
# Returns:
#   0 - Initiation failed.
#   1 - Function completed, no issueus.
# Description:
#   <> Validates the sign's quantity and price.

## Commands

# Validate Quantity Entered
scoreboard players set #is_valid ss.raycast 3
data modify storage ss:temp assign.quantity set from storage ss:temp sign.front_text.messages[2]
execute store result score #is_valid ss.raycast run function ss:operations/registration/sign/validate/quantity with storage ss:temp assign
execute unless score #is_valid ss.raycast matches 1 run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Quantity unrecognizable. Please try again, entering a numerical value on the third line of the sign."}]
execute unless score #is_valid ss.raycast matches 1 run data modify block ~ ~ ~ front_text.messages[0] set value ["",{text:"[Failed]",color:"dark_red"}]
execute unless score #is_valid ss.raycast matches 1 run data modify block ~ ~ ~ front_text.messages[2] set value ["",{text:"<NaN>",color:"dark_red"}]
execute unless score #is_valid ss.raycast matches 1 run kill @e[type=marker,distance=0..0.25]
execute unless score #is_valid ss.raycast matches 1 run return 0

# Validate Price Entered
scoreboard players set #is_valid ss.raycast 3
execute store result score #is_valid ss.raycast run function ss:operations/registration/sign/validate/price_stage
execute unless score #is_valid ss.raycast matches 1 run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Price unrecognizable. Please try again, entering a positve whole dollar amount on the fourth line of the sign. For example, $500"}]
execute unless score #is_valid ss.raycast matches 1 run data modify block ~ ~ ~ front_text.messages[0] set value ["",{text:"[Failed]",color:"dark_red"}]
execute unless score #is_valid ss.raycast matches 1 run data modify block ~ ~ ~ front_text.messages[3] set value ["",{text:"<$NA>",color:"dark_red"}]
execute unless score #is_valid ss.raycast matches 1 run kill @e[type=marker,distance=0..0.25]
execute unless score #is_valid ss.raycast matches 1 run return 0

tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Sign shop initiated. Please place the item in your mainhand and right click the sign."}]