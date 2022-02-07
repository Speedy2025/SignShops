## FULL SET BUY RECOVERY FUNCTION
# Context: Marker
# Calls:
#   - signshops:operations/recovery/buy/full
# Called by:
#   - signshops:operations/recovery/buy/root
# Description:
#   <> Puts a full set into collection

## COMMANDS

# Update Stock
scoreboard players operation @s ss.stock -= @s ss.matches

# Add to Collection
data modify storage rx:io player.data.signshops.collect.Items append from entity @s data.Item

# Loop if needed
execute if score @s ss.stock >= @s ss.matches run function signshops:operations/recovery/buy/full