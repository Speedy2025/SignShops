## Signshops Start Sign Detect
# Context: Self at Projected Position
# Calls:
#   - ss:operations/detect_sign/trace
# Called by:
#   - ss:operations/detect_sign/start
# Returns:
#   0 - No Sign Found
#   1 - Uninitiated Sign Found
#   2 - Initiated Sign Found
#   Creates marker for discovered sign
# Description:
#   <> Casts a dumb ray through until it finds a sign

## Commands

# Note, I have some exceptions in the beginning. This is for sign penetration - requires for more accurate sign clicking. It isn't the best or optimal solution, but one that seemed to work more ofthen than not.

# Uninitiated Sign
execute unless block ^ ^ ^0.5 #minecraft:wall_signs unless block ^ ^ ^0.25 #minecraft:wall_signs unless block ^ ^ ^1 #minecraft:wall_signs unless block ^ ^ ^1.25 #minecraft:wall_signs align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:signs unless entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] run summon marker ~ ~ ~ {Tags:['ss.found']}
execute unless block ^ ^ ^0.5 #minecraft:wall_signs unless block ^ ^ ^0.25 #minecraft:wall_signs unless block ^ ^ ^1 #minecraft:wall_signs unless block ^ ^ ^1.25 #minecraft:wall_signs align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:signs unless entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] run return 1

# Initiated Sign
execute unless block ^ ^ ^0.5 #minecraft:wall_signs unless block ^ ^ ^0.25 #minecraft:wall_signs unless block ^ ^ ^1 #minecraft:wall_signs unless block ^ ^ ^1.25 #minecraft:wall_signs align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:signs if entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] run summon marker ~ ~ ~ {Tags:['ss.found']}
execute unless block ^ ^ ^0.5 #minecraft:wall_signs unless block ^ ^ ^0.25 #minecraft:wall_signs unless block ^ ^ ^1 #minecraft:wall_signs unless block ^ ^ ^1.25 #minecraft:wall_signs align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:signs if entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] run return 2

# Continue if neither
scoreboard players remove #iterations ss.raycast 1
execute if score #iterations ss.raycast matches 1.. positioned ^ ^ ^0.05 run return run function ss:operations/detect_sign/trace
execute if score #iterations ss.raycast matches 0 run return 0