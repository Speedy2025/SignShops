## SignShops Interaction & Stage 2 Initialization Start
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/start
#   - ss:operations/interact/buy/start
# Called by:
#   - ss:operations/detect_sign/start
# Returns:
#   0 - Initiation failed.
#   1 - Function completed, no issues.
#   <None> - No issues.
# Description:
#   <> Redirects to the appropriate action, part 1 of unknown amount

## Commands

#Show interaction target, for debug purposes.
particle crit ~ ~ ~ 0 0 0 0 1 force @s

#Redirect
execute if data entity @e[type=marker,tag=ss.marker,limit=1,distance=0..0.25] data.ss{type: "buy", ready: 0b} if predicate ss:mainhand run return run function ss:operations/registration/sign/initiate/start
execute if data entity @e[type=marker,tag=ss.marker,limit=1,distance=0..0.25] data.ss{type: "sell", ready: 0b} if predicate ss:mainhand run return run function ss:operations/registration/sign/initiate/start
execute if data entity @e[type=marker,tag=ss.marker,limit=1,distance=0..0.25] data.ss{type: "buy", ready: 1b} unless predicate ss:sneak run return run function ss:operations/interact/buy/start
execute if data entity @e[type=marker,tag=ss.marker,limit=1,distance=0..0.25] data.ss{type: "sell", ready: 1b} unless predicate ss:sneak run return run function ss:operations/interact/sell/start
execute if data entity @e[type=marker,tag=ss.marker,limit=1,distance=0..0.25] data.ss{type: "buy", ready: 1b} if predicate ss:sneak run return run function ss:operations/interact/buy/check_stock
execute if data entity @e[type=marker,tag=ss.marker,limit=1,distance=0..0.25] data.ss{type: "sell", ready: 1b} if predicate ss:sneak run return run function ss:operations/interact/sell/check_stock