# Sell signs have a balance.
function ss:operations/interact/buy/get_balance with storage ss:temp assign
execute store result score #amount ss.stock run data get entity @s data.ss.stock
scoreboard players operation #balance ss.stock += #amount ss.stock
function ss:operations/interact/buy/update_balance with storage ss:temp assign

# Updated.