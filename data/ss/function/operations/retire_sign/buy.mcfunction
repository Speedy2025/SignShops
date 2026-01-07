#Buy sign

# We need to create an entry for this item.
# Unlike selling, there are no restrictions to selling.
# We will treat this like we are "selling" ourselves an item - however we can mark this as a special case for review later in the collection system.
execute store result score #stock ss.raycast run data get entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock
execute if score #stock ss.raycast matches ..0 run return fail

data modify storage ss:temp entry set value {id: "", count: 0, components:{}, retired: true}
data modify storage ss:temp entry.id set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.id
data modify storage ss:temp entry.count set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.stock
data modify storage ss:temp entry.components set from entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.components

$data modify storage se:storage vals[{UUID: $(UUID)}].ss.Collection.Items append from storage ss:temp entry
data remove storage ss:temp entry