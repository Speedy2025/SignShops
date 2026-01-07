loot give @s mine 0 -64 0 stick[custom_data={drop_contents:1b}]
scoreboard players remove #amount ss.stock 1
execute if score #amount ss.stock matches 1.. run function ss:operations/interact/buy/give_item