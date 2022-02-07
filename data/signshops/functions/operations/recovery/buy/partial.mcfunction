## PARTIAL SET BUY RECOVERY FUNCTION
# Context: Marker
# Calls:
#   - None
# Called by:
#   - signshops:operations/recovery/buy/root
# Description:
#   <> Puts a full set into collection

## COMMANDS
# Add Remaining to Collection
data modify storage rx:io player.data.signshops.collect.Items append from entity @s data.Item
execute store result storage rx:io player.data.signshops.collect.Items.Count byte 1 run scoreboard players get @s ss.stock

# At this rate, it doesn't matter what the stock is, so to save overhead I won't bother updating it.