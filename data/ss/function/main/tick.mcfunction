## Signshops Tick
# Context: None
# Calls:
#   - ss:operations/registration/start (First-Time or Name Change)
#   - ss:operations/detect_sign/start
# Called by:
#   - None
# Description:
#   <> Ticking used by SignShops

# There are several admin tags you can use to enable or disable functionality.
# ss.disable.all        disables all features
# ss.disable.signs      disables sign interaction and creation
# ss.disable.creation   disables sign creation
# ss.disable.balance    dsiables seeing balance
# ss.disable.retrieve   disables retrieving from collection
# ss.disable.transfer   disables sending of money
# ss.adminshop          creates admin shops instead of normal ones
# ss.init // ss.done    player initiated

## Commands
# Initialize new players
#execute as @a[tag=ss.init] run function ss:operations/registration/start
#tag @a[tag=!ss.done] add ss.init

# Scan for a Sign
execute as @a[tag=!ss.disable.all,tag=!ss.disable.signs] at @s anchored eyes run function ss:operations/detect_sign/start
scoreboard players reset @a ss.interact
scoreboard players enable @a[tag=!ss.disable.all,tag=!ss.disable.signs] ss.interact


execute as @e[type=marker,tag=ss.marker] at @s unless block ~ ~ ~ #minecraft:wall_signs run function ss:operations/retire_sign/start

execute as @a[tag=!ss.disable.all,tag=!ss.disable.balance,scores={ss.balance=1..}] run function ss:operations/balance/check
scoreboard players reset @a ss.balance
scoreboard players enable @a[tag=!ss.disable.all,tag=!ss.disable.balance] ss.balance

execute as @a[scores={ss.transfer=1..}] run function ss:operations/transfer/start
execute as @a[scores={ss.transfer=..-1}] run function ss:operations/transfer/start
scoreboard players reset @a ss.transfer
scoreboard players enable @a[tag=!ss.disable.all,tag=!ss.disable.transfer] ss.transfer

execute as @a[scores={ss.retrieve=1..}] run function ss:operations/retrieve/start
scoreboard players reset @a ss.retrieve
scoreboard players enable @a[tag=!ss.disable.all,tag=!ss.disable.retrieve] ss.retrieve