## SignShops Stage 1 - Validation (Quantity)
# Context: Self at Projected Position
# Calls:
#   - <None>
# Called by:
#   - ss:operations/registration/sign/validate/start
# Returns:
#   0 - The input is not a number.
#   1 - The input is a real number.
# Description:
#   <> Validates the number of the sign, then applies it (debugging mechanism)

## Commands

$data modify entity @e[type=marker,distance=0..0.25,limit=1,tag=ss.marker] data.ss.amount set value $(quantity)
$data modify block ~ ~ ~ front_text.messages[2] set value ["",{text:"$(quantity)"}]
return 1
$tellraw @s[type=!player] ["",{text:"$(quantity)"}]