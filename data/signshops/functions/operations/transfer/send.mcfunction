## SEND MONEY FUNCTION
# Context: Player
# Calls:
#   - None
# Called by:
#   - signshops:main/tick
# Description:
#   <> Sends money to the destination player

## COMMANDS

# Fix balance
scoreboard players operation @s ss.transfer *= #const.n1 ss.COSNTANT

# Check balance & if they're online
execute if score @s ss.transfer <= @s ss.currency run tag @s add ss.target
execute as @a if score @s rx.uid = @a[tag=ss.target,limit=1] ss.destination run tag @s add ss.destination

execute unless entity @a[tag=ss.target] run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"You cannot transfer more than "},{"text":"$","color":"gold"},{"score":{"name":"@s","objective":"ss.currency"},"color":"gold"}]
execute unless entity @a[tag=ss.destination] run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"The target player is offline, aborted transfer."}]

execute if entity @a[tag=ss.destination] if entity @s[tag=ss.target] run scoreboard players operation @s ss.currency -= @s ss.transfer
execute if entity @a[tag=ss.destination] if entity @s[tag=ss.target] run scoreboard players operation @a[tag=ss.destination,limit=1] ss.currency += @s ss.transfer
execute if entity @a[tag=ss.destination] if entity @s[tag=ss.target] run tellraw @a[tag=ss.destination,limit=1] ["",{"text":"[SignShops] ","color":"green"},{"text":"Recieved "},{"text":"$","color":"gold"},{"score":{"name":"@a[tag=ss.target,limit=1]","objective":"ss.transfer"},"color":"gold"}]
execute if entity @a[tag=ss.destination] if entity @s[tag=ss.target] run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Sent "},{"text":"$","color":"gold"},{"score":{"name":"@s","objective":"ss.transfer"},"color":"gold"}]

tag @a remove ss.target
tag @a remove ss.destination

scoreboard players reset @s ss.destination