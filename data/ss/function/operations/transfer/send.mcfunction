
data modify storage ss:temp assign set value {}
data modify storage ss:temp assign.UUID set from entity @s UUID
function ss:operations/interact/buy/get_balance with storage ss:temp assign

scoreboard players set #random ss.stock 0
execute if score #balance ss.stock < @s ss.transfer store result score #random ss.stock run random value 1..100
execute if score #random ss.stock matches 1..94 run return run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" You cannot transfer more than you have. Please try again. Balance: "},{text:"$",color:"gold"},{score:{name:"#balance",objective:"ss.stock"},color:"gold"}]
execute if score #random ss.stock matches 95..96 run return run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" You are too poor. Balance: "},{text:"$",color:"gold"},{score:{name:"#balance",objective:"ss.stock"},color:"gold"}]
execute if score #random ss.stock matches 97..98 run return run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Survey says: No. Balance: "},{text:"$",color:"gold"},{score:{name:"#balance",objective:"ss.stock"},color:"gold"}]
execute if score #random ss.stock matches 99..100 run return run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Infinite money glitch failed. Balance: "},{text:"$",color:"gold"},{score:{name:"#balance",objective:"ss.stock"},color:"gold"}]

scoreboard players operation #balance ss.stock -= @s ss.transfer
function ss:operations/interact/buy/update_balance with storage ss:temp assign

tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" Sent successfully. Updated balance: "},{text:"$",color:"gold"},{score:{name:"#balance",objective:"ss.stock"},color:"gold"}]

#Send the money over
tag @s add ss.sender
execute as @a[tag=!ss.sender] if score @s se.uid = @a[tag=ss.sender,limit=1] ss.target run tellraw @s ["",{text:"[Sign Shop]",color:"green"},{text:" You have recieved "},{text:"$",color:"gold"},{score:{name:"@a[tag=ss.sender,limit=1]",objective:"ss.transfer"},color:"gold"},{text:" from "},{selector:"@a[tag=ss.sender,limit=1]"},"."]
tag @s remove ss.sender

execute store result storage ss:temp assign.uid int 1 run scoreboard players get @s ss.target
function ss:operations/transfer/get_uuid with storage ss:temp assign
function ss:operations/interact/buy/get_balance with storage ss:temp assign
scoreboard players operation #balance ss.stock += @s ss.transfer
function ss:operations/interact/buy/update_balance with storage ss:temp assign

tag @s remove ss.transfer
scoreboard players reset @s ss.target