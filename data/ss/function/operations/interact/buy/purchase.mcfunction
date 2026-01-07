# First, filter out low stock
execute store result score #stock ss.stock run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock
execute store result score #amount ss.stock run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.amount
execute store result score #price ss.stock run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.price
execute if entity @e[type=marker,tag=ss.marker,tag=!ss.adminshop,limit=1] unless score #stock ss.stock matches -1 if score #stock ss.stock < #amount ss.stock run return fail

# Now, filter out players who don't have enough money.
data modify storage ss:temp val.UUID set from entity @s UUID
function ss:operations/interact/buy/get_balance with storage ss:temp val

execute if score #balance ss.stock < #price ss.stock run return run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" You cannot afford this. Balance: ",},{text:"$",color:"gold"},{score:{name:"#balance",objective:"ss.stock"},color:"gold"},{text:" (Need "},{text:"$",color:"gold"},{score:{name:"#price",objective:"ss.stock"},color:"gold"},")"]


#Now, the player has enough money.
scoreboard players operation #balance ss.stock -= #price ss.stock
function ss:operations/interact/buy/update_balance with storage ss:temp val


execute unless entity @e[type=marker,tag=ss.marker,tag=ss.adminshop,distance=0..0.25,limit=1] run data modify storage ss:temp val.UUID set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner
execute unless entity @e[type=marker,tag=ss.marker,tag=ss.adminshop,distance=0..0.25,limit=1] run function ss:operations/interact/buy/get_balance with storage ss:temp val
execute unless entity @e[type=marker,tag=ss.marker,tag=ss.adminshop,distance=0..0.25,limit=1] run scoreboard players operation #balance ss.stock += #price ss.stock
execute unless entity @e[type=marker,tag=ss.marker,tag=ss.adminshop,distance=0..0.25,limit=1] run function ss:operations/interact/buy/update_balance with storage ss:temp val


#To award the player the item(s) they have purchased, we need to do a few things:
# 1. Switch dimension context to overworld at 0, -64, 0
# 2. Put the item inside the shulker box
# 3. Loot said shulker box
# 4. Cry about it when they complain they "didn't get their items" (but they did and they're lying)
#
# We can merge steps 1/2 together, but 2 requires a few commands.

# Start by tagging this marker.
tag @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] add ss.this

scoreboard players set #force_drop ss.stock 1
data modify storage ss:temp val set value {Collection:{Items:[{id: "x", count: 0, components:{}}]}}
data modify storage ss:temp val.Collection.Items[0].id set from entity @e[type=marker,tag=ss.this,limit=1] data.ss.id
data modify storage ss:temp val.Collection.Items[0].count set from entity @e[type=marker,tag=ss.this,limit=1] data.ss.amount
data modify storage ss:temp val.Collection.Items[0].components set from entity @e[type=marker,tag=ss.this,limit=1] data.ss.components
function ss:operations/retrieve/obtain_items

execute store result entity @e[type=marker,tag=ss.marker,tag=!ss.adminshop,distance=0..0.25,limit=1] data.ss.stock int 1 run scoreboard players operation #stock ss.stock -= #amount ss.stock
execute unless entity @e[type=marker,tag=ss.adminshop,distance=0..0.25,limit=1] run function ss:operations/update_sign/start


tag @e[type=marker] remove ss.this