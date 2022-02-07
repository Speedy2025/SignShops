## RAYCAST INIT. FUNCTION
# Context: Player
# Calls:
#   - signshops:operations/detect/trace
# Called by:
#   - signshops:main/tick
# Description:
#   <> Used to initialize the detection


## COMMANDS

#Set the distance, in quarter blocks
#- Max Player Reach in Creative: 5 blocks
scoreboard players set #iterations ss.raycast 20

#Reset failure status
# 0 - No Sign
# 1 - Sign, Uninitialized
# 2 - Sign, Initialized
scoreboard players set #success ss.raycast 0

#Run the tracer
execute anchored eyes positioned ^ ^ ^0 run function signshops:operations/detect/trace