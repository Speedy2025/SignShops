
data modify storage ss:temp assign.UUID set from entity @s UUID
function ss:operations/interact/buy/get_balance with storage ss:temp assign

execute store result score #amount ss.stock run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.price

execute if score #balance ss.stock < #amount ss.stock run return fail

scoreboard players operation #balance ss.stock -= #amount ss.stock
function ss:operations/interact/buy/update_balance with storage ss:temp assign

execute store result score #stock ss.stock run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock
execute store result entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock int 1 run scoreboard players operation #stock ss.stock += #amount ss.stock

function ss:operations/update_sign/start
