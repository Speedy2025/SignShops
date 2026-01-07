execute if score @s ss.transfer matches ..0 if entity @s[tag=ss.transfer] run return run function ss:operations/transfer/stop
execute if score @s ss.transfer matches 1.. if entity @s[tag=ss.transfer] run return run function ss:operations/transfer/send
execute if score @s ss.transfer matches ..0 unless entity @s[tag=ss.transfer] run return fail
data modify storage ss:temp assign set value {}
execute store result storage ss:temp assign.uid int 1 run scoreboard players get @s ss.transfer
return run function ss:operations/transfer/get_target with storage ss:temp assign