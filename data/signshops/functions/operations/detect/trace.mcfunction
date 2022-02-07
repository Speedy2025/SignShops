## RAYCAST FUNCTION
# Context: Player
# Calls:
#   - signshops:operations/detect/trace
#   - signshops:operations/interact/root
# Called by:
#   - signshops:operations/detect/root
# Description:
#   <> The raycast


## COMMANDS

#Check uninitalized
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:signs unless entity @e[tag=ss.marker,distance=0..0.25] run scoreboard players set #success ss.raycast 1

#Check initalized
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:signs if entity @e[tag=ss.marker,distance=0..0.25] run scoreboard players set #success ss.raycast 2

#If either, begin testing
# Extra check to see if there's a block ahead
execute if score #success ss.raycast matches 1.. if block ^ ^ ^0.5 #minecraft:signs run scoreboard players set #success ss.raycast 0

execute if score #success ss.raycast matches 1.. unless block ^ ^ ^1 #minecraft:signs run function signshops:operations/interact/root

#If neither, continue the raycast
scoreboard players remove #iterations ss.raycast 1
execute if score #success ss.raycast matches 0 if score #iterations ss.raycast matches 1.. positioned ^ ^ ^0.2 run function signshops:operations/detect/trace