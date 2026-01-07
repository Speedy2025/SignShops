## SignShops Stage 1 - Initiation
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/buy
#   - ss:operations/registration/sign/sell
# Called by:
#   - ss:operations/detect_sign/start
# Returns:
#   0 - Initiation failed.
#   1 - Function completed, no issueus.
# Description:
#   <> Applies additional context and directs function to appropriate type of sign for stage 1 of initiation.

## Commands

data modify storage ss:temp sign set from block ~ ~ ~

scoreboard players set #type ss.raycast 2

data modify storage ss:temp compare set value "[Buy]"
execute store success score #type ss.raycast run data modify storage ss:temp compare set from storage ss:temp sign.front_text.messages[0]
execute if score #type ss.raycast matches 0 run return run function ss:operations/registration/sign/buy

scoreboard players set #type ss.raycast 2

data modify storage ss:temp compare set value "[Sell]"
execute store success score #type ss.raycast run data modify storage ss:temp compare set from storage ss:temp sign.front_text.messages[0]
execute if score #type ss.raycast matches 0 run return run function ss:operations/registration/sign/sell

return 0