execute as @s[tag=ss.adminshop] run return run kill @s

data modify storage ss:temp assign set value {}
data modify storage ss:temp assign.UUID set from entity @s data.ss.Owner
execute if data entity @s data.ss{type: "buy"} run function ss:operations/retire_sign/buy with storage ss:temp assign
execute if data entity @s data.ss{type: "sell"} run function ss:operations/retire_sign/sell with storage ss:temp assign
kill @s