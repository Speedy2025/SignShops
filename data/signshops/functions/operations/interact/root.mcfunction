## INTERACTION ROOT FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - signshops:operations/interact/init/root
#   - signshops:operations/interact/redirect
# Called by:
#   - signshops:operations/detect/trace
# Description:
#   <> Quickly redirects to save performance on failed initializations

## COMMANDS

# If it's initialized check for interaction
execute if score #success ss.raycast matches 2 if score @s ss.interact matches 1.. run function signshops:operations/interact/redirect
execute if score #success ss.raycast matches 2 if score @s ss.interact matches ..-1 run function signshops:operations/interact/redirect

# If it's not initialized
# New success value: 3, if it's an initializing sign
execute if score #success ss.raycast matches 1 run function signshops:operations/interact/init/root

#Enable the sign, if needed
scoreboard players reset @s ss.interact
scoreboard players enable @s ss.interact