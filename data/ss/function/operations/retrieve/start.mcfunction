data modify storage ss:temp key set value {UUID:[]}
data modify storage ss:temp key.UUID set from entity @s UUID
function ss:operations/retrieve/get_data with storage ss:temp key
scoreboard players set #force_drop ss.stock 0
function ss:operations/retrieve/obtain_items
tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Retrieved items."}]
function ss:operations/retrieve/save_data with storage ss:temp key