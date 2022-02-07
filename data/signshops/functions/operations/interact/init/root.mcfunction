## INIT SIGN ROOT FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - signshops:operations/interact/init/buy/root
#   - signshops:operations/interact/init/sell/root
# Called by:
#   - signshops:operations/interact/root
# Description:
#   <> Initializes a sign for operation

## COMMANDS

#If the sign hasn't been messed with at all
execute if block ~ ~ ~ #minecraft:signs{Text1:'{"text":"[Buy]"}'} run function signshops:operations/interact/init/buy/root
execute if block ~ ~ ~ #minecraft:signs{Text1:'{"text":"[Sell]"}'} run function signshops:operations/interact/init/sell/root

#Main Set
execute if block ~ ~ ~ #minecraft:signs{Text1:'{"color":"gold","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @s ss.interact matches 1 unless entity @e[tag=ss.target] if data entity @s SelectedItem unless data entity @s SelectedItem.tag run function signshops:operations/interact/init/buy/set
execute if block ~ ~ ~ #minecraft:signs{Text1:'{"color":"gold","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @s ss.interact matches 1 unless entity @e[tag=ss.target] if data entity @s SelectedItem unless data entity @s SelectedItem.tag run function signshops:operations/interact/init/sell/set

#Alternative Set (for allowing damage based items)
execute store result score @s ss.matches run data get entity @s SelectedItem.tag
execute if block ~ ~ ~ #minecraft:signs{Text1:'{"color":"gold","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'} if score @s ss.interact matches 1 unless entity @e[tag=ss.target] if data entity @s SelectedItem if score @s ss.matches matches 1 if data entity @s SelectedItem.tag{Damage: 0} run function signshops:operations/interact/init/buy/set
execute if block ~ ~ ~ #minecraft:signs{Text1:'{"color":"gold","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Sell]"}'} if score @s ss.interact matches 1 unless entity @e[tag=ss.target] if data entity @s SelectedItem if score @s ss.matches matches 1 if data entity @s SelectedItem.tag{Damage: 0} run function signshops:operations/interact/init/sell/set

#'{"text":"[Buy]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'