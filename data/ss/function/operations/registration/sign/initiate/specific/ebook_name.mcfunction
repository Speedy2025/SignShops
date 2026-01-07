## SignShops Stage 2 - Enchanted Book Initiation - Naming
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/specific/ebook_name2
#   - ss:operations/registration/sign/initiate/specific/ebook_name_strip
# Called by:
#   - ss:operations/registration/sign/initiate/specific/ebook
# Returns:
#   Status of final product.
# Description:
#   <> Begins processing the name for a sign based on an enchanted book

## Commands

# Resolve the component
# Wierdly, seems required.
scoreboard players set #force_failure ss.raycast 1
$data modify block ~ ~ ~ front_text.messages[1] set value [{text:'$(part)'}]

data modify storage ss:temp assign.name set from block ~ ~ ~ front_text.messages[1]

# Strip the namespace of the enchantment
execute store result score #len ss.raycast run data get storage ss:temp assign.name
execute store result storage ss:temp assign.len int 1 run scoreboard players get #len ss.raycast
function ss:operations/registration/sign/initiate/specific/ebook_name_strip with storage ss:temp assign

# Acquire the cost
$data modify block ~ ~ ~ front_text.messages[1] set value [{text:'$(extra)'}]
data modify storage ss:temp assign.extra set from block ~ ~ ~ front_text.messages[1]

# Trimming!
execute store result score #len_n ss.raycast run data get storage ss:temp assign.extra
execute store result score #len ss.raycast run data get storage ss:temp assign.name
scoreboard players remove #len ss.raycast 3
scoreboard players operation #len ss.raycast -= #len_n ss.raycast
execute if score #len ss.raycast matches 13.. run scoreboard players set #len ss.raycast 13
execute store result storage ss:temp assign.len int 1 run scoreboard players get #len ss.raycast

# Put the final result on to the sign
return run function ss:operations/registration/sign/initiate/specific/ebook_name2 with storage ss:temp assign