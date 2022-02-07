## TICK FUNCTION
# Context: None
# Calls:
#   - signshops:operations/detect/root
#   - signshops:operations/register
#   - signshops:operations/recovery/root
#   - signshops:operations/retrieve/root
#   - signshops:operations/balance/root
# Called by:
#   - None
# Description:
#   <> Used to tick the datapack and call ops


## COMMANDS

# Initialize new players
execute as @a[tag=ss.init.cache] run function signshops:operations/register
tag @a[tag=!ss.init] add ss.init.cache

# Check if there's a sign
execute as @a at @s run function signshops:operations/detect/root

# Delete the markers if there isn't a sign (patent pending)
execute as @e[tag=ss.marker] at @s unless block ~ ~ ~ #minecraft:signs run function signshops:operations/recovery/root

# Check Retrieval System
execute as @a[scores={ss.retrieve=1..}] run function signshops:operations/retrieve/root
scoreboard players reset @a ss.retrieve

# Check Balance
execute as @a[scores={ss.balance=1..}] run function signshops:operations/balance/root
scoreboard players reset @a ss.balance
scoreboard players enable @a ss.balance

# Update Admin Shops
execute as @a unless score @s c.inv.curr matches 2 unless score @s c.inv.curr matches 11 run scoreboard players enable @s ss.retrieve
execute as @e[scores={ss.interact=-1}] run scoreboard players set @s ss.stock 999999999
