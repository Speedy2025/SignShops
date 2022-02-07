## Remove All STOCK FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/redirect
# Description:
#   <> Attempts to REMOVE ALL

## COMMANDS

#So, I'ma cheese it real gud
# Basically, I'm going to run the remove function until there's nothing left
execute if score @e[tag=ss.temp.target,limit=1] ss.stock matches 1.. run function signshops:operations/interact/buy/stock/remove
execute if score @e[tag=ss.temp.target,limit=1] ss.stock matches 1.. run function signshops:operations/interact/buy/stock/remove_all