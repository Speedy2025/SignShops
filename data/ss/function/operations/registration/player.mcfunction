tag @s add ss.init
data modify storage ss:temp val.UUID set from entity @s UUID
function ss:operations/registration/player_modify with storage ss:temp val