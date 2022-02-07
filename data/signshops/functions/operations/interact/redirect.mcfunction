## REDIRECTION FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - signshops:operations/interact/buy/root
#   - signshops:operations/interact/buy/stock/add
#   - signshops:operations/interact/buy/stock/remove
#   - signshops:operations/interact/buy/stock/remove_all
#   - signshops:operations/interact/buy/stock/check
#   - signshops:operations/interact/sell/root
#   - signshops:operations/interact/sell/stock/add
#   - signshops:operations/interact/sell/stock/remove
#   - signshops:operations/interact/sell/stock/remove_all
#   - signshops:operations/interact/sell/stock/check
# Called by:
#   - signshops:operations/interact/root
# Description:
#   <> Determines if the player is buying, selling, checking stock, or managing

## COMMANDS

#Set Marker to use
execute align xyz positioned ~0.5 ~0.5 ~0.5 run tag @e[type=marker,distance=0..0.25] add ss.temp.target

#Buy Sign
# Right Click (Not Owner)   Attempt to Buy
# Right Click (If Owner)    Add Stock
# Right Click (Shift)       Check Stock
# Manual -1                 Remove
# Manual -2                 Remove
execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} unless score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid unless score @s ss.interact matches ..-1 unless predicate signshops:sneaking run function signshops:operations/interact/buy/root

execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid unless score @s ss.interact matches ..-1 unless predicate signshops:sneaking run function signshops:operations/interact/buy/stock/add
execute if block ~ ~ ~ #signs{Text1:'{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid unless score @s ss.interact matches ..-1 unless predicate signshops:sneaking run function signshops:operations/interact/buy/stock/add

execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if predicate signshops:sneaking run function signshops:operations/interact/buy/stock/check
execute if block ~ ~ ~ #signs{Text1:'{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if predicate signshops:sneaking run function signshops:operations/interact/buy/stock/check

execute if block ~ ~ ~ #signs{Text1:'{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -1 run function signshops:operations/interact/buy/stock/remove
execute if block ~ ~ ~ #signs{Text1:'{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -2 run function signshops:operations/interact/buy/stock/remove_all

execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -1 run function signshops:operations/interact/buy/stock/remove
execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -2 run function signshops:operations/interact/buy/stock/remove_all


#Sell Sign
# Right Click (Not Owner)   Attempt to Sell
# Right Click (If Owner)    Collect Stock
# Right Click (Shift)       Check Stock
# Manual -1                 Remove
# Manual -2                 Remove
execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} unless score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid unless score @s ss.interact matches ..-1 unless predicate signshops:sneaking run function signshops:operations/interact/sell/root

execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid unless score @s ss.interact matches ..-1 unless predicate signshops:sneaking run function signshops:operations/interact/sell/stock/add
execute if block ~ ~ ~ #signs{Text1:'{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid unless score @s ss.interact matches ..-1 unless predicate signshops:sneaking run function signshops:operations/interact/sell/stock/add

execute if block ~ ~ ~ #signs{Text1:'{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -1 unless predicate signshops:sneaking run function signshops:operations/interact/sell/stock/remove
execute if block ~ ~ ~ #signs{Text1:'{"color":"red","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -2 unless predicate signshops:sneaking run function signshops:operations/interact/sell/stock/remove_all

execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -1 unless predicate signshops:sneaking run function signshops:operations/interact/sell/stock/remove
execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @e[tag=ss.temp.target,limit=1] ss.interact = @s rx.uid if score @s ss.interact matches -2 unless predicate signshops:sneaking run function signshops:operations/interact/sell/stock/remove_all

execute if block ~ ~ ~ #signs{Text1:'{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if predicate signshops:sneaking run function signshops:operations/interact/sell/stock/check

tag @e remove ss.temp.target