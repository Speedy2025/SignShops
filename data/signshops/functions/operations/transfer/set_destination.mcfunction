## SET DESTINATION FUNCTION
# Context: Player
# Calls:
#   - None
# Called by:
#   - signshops:main/tick
# Description:
#   <> Sets the destination player for transfers

## COMMANDS

# Check if it ISN'T themselves && check if the player is online before proceeding - otherwise ignore or error
tag @s add ss.fixcontext
scoreboard players operation #target ss.transfer = @s ss.transfer


execute unless score @s ss.transfer = @s rx.uid if entity @a[predicate=signshops:id_match] run scoreboard players operation @s ss.destination = @s ss.transfer
execute unless score @s ss.transfer = @s rx.uid if entity @a[predicate=signshops:id_match] run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Started sending money to "},{"storage":"rx.playerdb:io","nbt":"player.info.name","color":"gold"},{"text":". Run "},{"text":"/trigger ss.transfer set -#","color":"gold","hoverEvent":{"action":"show_text","value":["",{"text":"Click to copy the command, then type how much money you want to send!"}]},"clickEvent":{"action":"suggest_command","value":"/trigger ss.transfer set -"}},{"text":" to send the money!"}]
execute unless score @s ss.transfer = @s rx.uid unless entity @a[predicate=signshops:id_match] run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"That player is offline or doesn't exist."}]
tag @s remove ss.fixcontext