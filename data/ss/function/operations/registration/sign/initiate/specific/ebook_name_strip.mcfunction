## SignShops Stage 2.5 - Enchanted Book Initiation - Naming Strip
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/specific/ebook_name_strip
# Called by:
#   - ss:operations/registration/sign/initiate/specific/ebook_name
# Returns:
#   Success
# Description:
#   <> Strips the namespace

## Commands
scoreboard players add #force_failure ss.raycast 1

data modify storage ss:temp assign.key set value ":"
execute store result score #ss.not_end ss.raycast run data modify storage ss:temp assign.key set string storage ss:temp assign.name 0 1
$data modify storage ss:temp assign.name set string storage ss:temp assign.name 1 $(len)
execute if score #force_failure ss.raycast matches 15 run return fail

execute store result score #len ss.raycast run data get storage ss:temp assign.name
execute store result storage ss:temp assign.len int 1 run scoreboard players get #len ss.raycast

execute if score #ss.not_end ss.raycast matches 1 run function ss:operations/registration/sign/initiate/specific/ebook_name_strip with storage ss:temp assign