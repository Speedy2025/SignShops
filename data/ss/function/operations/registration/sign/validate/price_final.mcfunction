## SignShops Stage 1 - Validation (Price) Appearance
# Context: Self at Projected Position
# Calls:
#   - <None>
# Called by:
#   - ss:operations/registration/sign/validate/get_number
# Returns:
#   ERR - User failed to enter a valid price.
#   1 - Function completed, no issueus.
# Description:
#   <> Stores the price in the sign and marker

## Commands

# Final Validation
$scoreboard players set #validate ss.raycast $(price)
execute if score #validate ss.raycast matches ..0 run return fail

$data modify entity @e[type=marker,distance=0..0.25,limit=1,tag=ss.marker] data.ss.price set value $(price)
$data modify block ~ ~ ~ front_text.messages[3] set value ["",{text:"$"},{text:"$(price)"}]
return 1

#Extra Validation, never runs
$tellraw @s[type=!player] ["",{text:"$(price)"}]