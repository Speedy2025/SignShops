## ROOT VERIFY sell SIGN FUNCTION
# Context: None
# Calls:
#   - signshops:operations/interact/init/sell/verify/invalid
#   - signshops:operations/interact/init/sell/verify/loop_input
# Called by:
#   - <Command Block>
# Description:
#   <> Root function for verifying input

## COMMANDS
# ss.target is the marker
# ss.owner is whoever owns the sign

#Debug MSG
#tellraw @a [{"nbt":"out","storage":"suso.str:io","separator":""}]

#Check FIRST and LAST TWO match (if they do, that's promising)
scoreboard players set #price1 ss.matches 0
scoreboard players set #price2 ss.matches 0
scoreboard players set #price3 ss.matches 0
scoreboard players set #priceF ss.matches 0
scoreboard players set #failed ss.matches 0

#Check FIRST
data modify storage signshops:ops Price set value ["$",'"',"}"]
execute store result score #price1 ss.matches run data modify storage signshops:ops Price[0] set from storage suso.str:io out[0]

#Check LAST TWO
execute store result score #price2 ss.matches run data modify storage signshops:ops Price[1] set from storage suso.str:io out[-2]
execute if score #price2 ss.matches matches 0 store result score #price2 ss.matches run data modify storage signshops:ops Price[2] set from storage suso.str:io out[-1]

#Clear input
execute if score #price2 ss.matches matches 0 run data remove storage suso.str:io out[0]
execute if score #price2 ss.matches matches 0 run data remove storage suso.str:io out[-1]
execute if score #price2 ss.matches matches 0 run data remove storage suso.str:io out[-1]
execute store result score #price3 ss.matches run data get storage suso.str:io out

#Final Verification of Input - checkinput 
execute if score #price1 ss.matches matches 1 run function signshops:operations/interact/init/sell/verify/invalid
execute unless score #failed ss.matches matches 1 if score #price2 ss.matches matches 1 run function signshops:operations/interact/init/sell/verify/invalid
execute unless score #failed ss.matches matches 1 if score #price3 ss.matches matches 0 run function signshops:operations/interact/init/sell/verify/invalid

execute if score #price1 ss.matches matches 0 if score #price2 ss.matches matches 0 if score #price3 ss.matches matches 1.. run function signshops:operations/interact/init/sell/verify/loop_input
execute unless score #failed ss.matches matches 1 if score #priceF ss.matches matches 0 run function signshops:operations/interact/init/sell/verify/invalid
execute if score #priceF ss.matches matches 1.. as @e[tag=ss.target,limit=1] at @s run function signshops:operations/interact/init/sell/verify/valid


tag @a remove ss.owner
tag @e remove ss.target