## Signshops Start Sign Detect
# Context: Self
# Calls:
#   - ss:operations/detect_sign/trace
#   - ss:operations/registration/start
#   - ss:operations/interact/start
# Called by:
#   - ss:main/tick
# Description:
#   <> Starts a raycast used for detecting a sign - notably for editing

## Commands

#Set the distance, in 1/20th of a block.
#- Max player reach in creative is 5 blocks, unless modified.
scoreboard players set #iterations ss.raycast 100
scoreboard players set #success ss.raycast 0
#Run the tracer
#execute store result score #success ss.raycast anchored eyes positioned ^ ^ ^0 run function ss:operations/detect_sign/trace
execute store result score #success ss.raycast run function ss:operations/detect_sign/trace

execute if score #success ss.raycast matches 0 run return 0
execute if score #success ss.raycast matches 1 at @e[type=marker,tag=ss.found,limit=1,distance=0..5] if entity @s[tag=!ss.disable.all,tag=!ss.disable.signs,tag=!ss.disable.creation] at @e[type=marker,tag=ss.found] run function ss:operations/registration/sign/start
execute if score #success ss.raycast matches 2 at @e[type=marker,tag=ss.found,limit=1,distance=0..5] if entity @s[tag=!ss.disable.all,tag=!ss.disable.signs] unless score @s ss.interact matches 0 run function ss:operations/interact/start
kill @e[type=marker,tag=ss.found]