data modify storage ss:temp entry set value {id: "", count: 0, components:{}}
data modify storage ss:temp entry.id set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id
data modify storage ss:temp entry.count set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.amount
data modify storage ss:temp entry.components set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components
$data modify storage se:storage vals[{UUID: $(UUID)}].ss.Collection.Items append from storage ss:temp entry
data remove storage ss:temp entry