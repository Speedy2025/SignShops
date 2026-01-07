execute in overworld run item replace block 0 -64 0 container.0 from entity @s weapon.mainhand
execute in overworld run item modify block 0 -64 0 container.0 {function:"set_count",count:999}
execute store result score #max ss.raycast run data get block 0 -64 0 Items[{Slot: 0b}].count
return 1