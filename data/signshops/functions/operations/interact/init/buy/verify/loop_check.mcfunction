## LOOP INPUT CHECK FOR BUY SIGN FUNCTION
# Context: None
# Calls:
#   - signshops:operations/interact/init/buy/verify/loop_check
# Called by:
#   - signshops:operations/interact/init/buy/verify/loop_input
# Description:
#   <> Loops through the possible values for the input, returning 0-9 if it exists or 10 if it doesn't

## COMMANDS
#It's more efficient to run it from [-1] and on, but to make things easier I will do from [0] and on
execute store result score #price5 ss.matches run data modify storage signshops:ops Values[0] set from storage suso.str:io out[0]
execute if score #price5 ss.matches matches 1 run scoreboard players add #price4 ss.matches 1
execute if score #price5 ss.matches matches 1 run data remove storage signshops:ops Values[0]
execute if score #price5 ss.matches matches 1 unless score #price4 ss.matches matches 10.. run function signshops:operations/interact/init/buy/verify/loop_check