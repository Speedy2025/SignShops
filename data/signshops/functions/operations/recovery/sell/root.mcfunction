## SELL SIGN RECOVERY FUNCTION
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

#Update Balance
execute store result score @s ss.matches run data get storage rx:io player.data.signshops.collect.currency
execute store result storage rx:io player.data.signshops.collect.currency int 1 run scoreboard players operation @s ss.stock += @s ss.matches

# Save User
function #rx.playerdb:api/v2/save