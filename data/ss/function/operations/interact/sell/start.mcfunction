# Situation 1 - Check if adminshop
execute if entity @e[type=marker,tag=ss.adminshop,tag=ss.marker,distance=0..0.25,limit=1] run return run function ss:operations/interact/sell/sell
# Situation 2 - Check who's shop it is

#Store UUID, compare to it.
data modify storage ss:temp UUID set from entity @s UUID
execute store result score #customer ss.raycast run data modify storage ss:temp UUID set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner
execute if score #customer ss.raycast matches 1 run return run function ss:operations/interact/sell/sell
return run function ss:operations/interact/sell/restock