## BUY SIGN RECOVERY FUNCTION
# Context: Marker
# Calls:
#   - None
# Called by:
#   - signshops:main/tick
# Description:
#   <> Attempts to recover marker's contents

## COMMANDS
# Open User
scoreboard players operation $in.uid rx.pdb.io = @s ss.interact
function #rx.playerdb:api/v2/get

# Calculate how much to give back
# Full will run before partial to save on overhead
execute store result score @s ss.matches run data get entity @s data.Item.Count
execute if score @s ss.stock >= @s ss.matches run function signshops:operations/recovery/buy/full
execute if score @s ss.stock < @s ss.matches if score @s ss.stock matches 1.. run function signshops:operations/recovery/buy/partial
function #rx.playerdb:api/v2/save
