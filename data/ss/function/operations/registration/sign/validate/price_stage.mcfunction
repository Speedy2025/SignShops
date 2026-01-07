## SignShops Stage 1 - Validation (Price)
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/validate/get_number
# Called by:
#   - ss:operations/registration/sign/validate/start
# Returns:
#   0 - Initiation failed.
#   1 - Function completed, no issueus.
# Description:
#   <> Begins the validation process for a price, in whole USD

## Commands

# Validate Length
execute store result storage ss:temp assign.len int 1 run data get storage ss:temp sign.front_text.messages[3]
execute store result score #len ss.raycast run data get storage ss:temp sign.front_text.messages[3]
execute unless score #len ss.raycast matches 2.. run return 0

# Validate Prefix
scoreboard players set #refuse ss.raycast 2
data modify storage ss:temp assign.currency set value "$"
execute store result score #refuse ss.raycast run data modify storage ss:temp assign.currency set string storage ss:temp sign.front_text.messages[3] 0 1
execute if score #refuse ss.raycast matches 1.. run return 0

# Validate Number
return run function ss:operations/registration/sign/validate/get_number with storage ss:temp assign