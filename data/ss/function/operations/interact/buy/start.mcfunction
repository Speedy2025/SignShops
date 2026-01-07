## SignShops Purchase Redirect
# Context: Self at Projected Position
# Calls:
#   - ss:operations/interact/buy/purchase
#   - ss:operations/interact/buy/restock
# Called by:
#   - ss:operations/interact/start
# Returns:
#   0 - They were broke.
#   1 - Function completed, no issues.
#   <None> - No issues.
# Description:
#   <> Redirects to the correct kind of transaction

## Commands

# There are two (3) situations to consider:
# 1. Not our shop // adminshop -> Redirect to Buy
# 2. Our shop -> Redirect to restock

# Situation 1 - Check if adminshop
execute if entity @e[type=marker,tag=ss.adminshop,tag=ss.marker,distance=0..0.25,limit=1] run return run function ss:operations/interact/buy/purchase

# Situation 2 - Check who's shop it is

#Store UUID, compare to it.
data modify storage ss:temp UUID set from entity @s UUID
execute store result score #customer ss.raycast run data modify storage ss:temp UUID set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner
execute if score #customer ss.raycast matches 1 run return run function ss:operations/interact/buy/purchase
return run function ss:operations/interact/buy/restock