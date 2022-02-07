## BUY FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Attempts to BUY

## COMMANDS

#First, check to see if they are eligable to buy stock
execute if score @s ss.currency >= @e[tag=ss.temp.target,limit=1] ss.currency run function signshops:operations/interact/buy/success
execute if score @s ss.currency < @e[tag=ss.temp.target,limit=1] ss.currency run tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"You cannot afford that item. Balance: "},{"text":"$","color":"gold"},{"score":{"name":"@s","objective":"ss.currency"},"color":"gold"},{"text":"."}]