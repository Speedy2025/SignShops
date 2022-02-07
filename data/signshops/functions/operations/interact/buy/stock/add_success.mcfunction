## ADD STOCK SUCCESS FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/buy/stock/add
# Description:
#   <> Actually adds the stock

## COMMANDS

#Update Stock
execute store result score @s ss.stock run data get entity @s SelectedItem.Count
scoreboard players operation @e[tag=ss.temp.target,limit=1] ss.stock += @s ss.stock
#tellraw @a [{"score":{"name":"@s","objective":"ss.stock"}},{"text":" >> "},{"score":{"name":"@e[tag=ss.temp.target,limit=1]","objective":"ss.stock"}}]

#Clear Slot
item replace entity @s weapon.mainhand with minecraft:air

#Update Sign if Needed
execute store result score @s ss.stock run data get entity @e[tag=ss.temp.target,limit=1] data.Item.Count
execute if score @e[tag=ss.temp.target,limit=1] ss.stock >= @s ss.stock run data modify block ~ ~ ~ Text1 set value '{"color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"},"text":"[Buy]"}'

#Inform player
tellraw @s ["",{"text":"[SignShops] ","color":"green"},{"text":"Added to the shop's stock"}]