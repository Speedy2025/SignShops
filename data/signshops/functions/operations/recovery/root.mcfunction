## ROOT RECOVERY FUNCTION
# Context: Marker
# Calls:
#   - signshops:operations/recovery/buy/root
# Called by:
#   - signshops:main/tick
# Description:
#   <> Attempts to recover the sign

## COMMANDS
execute if entity @s[tag=ss.buy,scores={ss.interact=0..}] run function signshops:operations/recovery/buy/root
execute if entity @s[tag=ss.sell,scores={ss.interact=0..}] run function signshops:operations/recovery/sell/root

kill @s