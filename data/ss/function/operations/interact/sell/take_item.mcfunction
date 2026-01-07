item modify entity @s weapon.mainhand {function:"set_count",count:-1,add:true}
scoreboard players remove #item_count ss.raycast 1
execute if score #item_count ss.raycast matches 1.. run function ss:operations/interact/sell/take_item