data modify storage ss:temp assign.id set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id
data modify storage ss:temp assign.components set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components
data modify storage ss:temp assign.count set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.amount
data modify storage ss:temp assign.stock set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock
data modify storage ss:temp assign.UUID set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.Owner
function ss:operations/interact/buy/show_stock with storage ss:temp assign