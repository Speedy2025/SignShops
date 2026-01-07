# Item matches?

execute unless data entity @s SelectedItem run return fail
data modify storage ss:temp verify set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id
execute store result score #item_ok ss.raycast run data modify storage ss:temp verify set from entity @s SelectedItem.id
execute if score #item_ok ss.raycast matches 1.. run return fail

# Same components?

execute if data entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components run scoreboard players set #item_components ss.raycast 1
execute if score #item_components ss.raycast matches 1 run data modify storage ss:temp verify set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components
execute if score #item_components ss.raycast matches 1 run execute store result score #item_ok ss.raycast run data modify storage ss:temp verify set from entity @s SelectedItem.components
execute if score #item_components ss.raycast matches 1 run execute if score #item_ok ss.raycast matches 1.. run return fail

# Holding correct amount?

execute store result score #item_count ss.raycast run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.amount
execute store result score #held_count ss.raycast run data get entity @s SelectedItem.count
execute if score #held_count ss.raycast < #item_count ss.raycast run return fail

# There's enough money?

execute store result score #price ss.stock run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.price
execute store result score #stock ss.stock run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock
execute if entity @e[type=marker,tag=ss.marker,tag=ss.adminshop,distance=0..0.25,limit=1] run scoreboard players operation #stock ss.stock = #price ss.stock
execute if score #stock ss.stock < #price ss.stock run return fail

# Update stock
execute store result entity @e[type=marker,tag=ss.marker,tag=!ss.adminshop,distance=0..0.25,limit=1] data.ss.stock int 1 run scoreboard players operation #stock ss.stock -= #price ss.stock
function ss:operations/update_sign/start

# Send the transaction to collection
execute unless entity @e[type=marker,tag=ss.marker,tag=ss.adminshop,distance=0..0.25,limit=1] run data modify storage ss:temp assign.UUID set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner
execute unless entity @e[type=marker,tag=ss.marker,tag=ss.adminshop,distance=0..0.25,limit=1] run function ss:operations/interact/sell/send_transaction with storage ss:temp assign

# Take the player's item
function ss:operations/interact/sell/take_item

# Send the money over

data modify storage ss:temp assign.UUID set from entity @s UUID
function ss:operations/interact/buy/get_balance with storage ss:temp assign
scoreboard players operation #balance ss.stock += #price ss.stock
function ss:operations/interact/buy/update_balance with storage ss:temp assign