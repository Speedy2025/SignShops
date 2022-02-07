## LOOP INPUT BUY SIGN FUNCTION
# Context: None
# Calls:
#   - signshops:operations/interact/init/buy/verify/loop_check
# Called by:
#   - signshops:operations/interact/init/buy/verify/root
# Description:
#   <> Loops through the remaining input if there's any to be had

## COMMANDS

#Summary of function pair:
# 1. Multiply #priceF by 10 (will fail first time, but is ok)
# 2. Run loop_check to get the number (if it is)
# - 3. If not, fail
# - 4. If yes, add to #priceF
# 5. Query Length
# 6. If Length > 0 loop again
scoreboard players set #price4 ss.matches 0

# Multiple #priceF by 10 (can fail, is ok)
scoreboard players operation #priceF ss.matches *= #const.10 ss.CONSTANT

# Run loop_check to get the number (if it is one)
data modify storage signshops:ops Values set value ["0","1","2","3","4","5","6","7","8","9"]
function signshops:operations/interact/init/buy/verify/loop_check

# Fail or add to #priceF
execute if score #price4 ss.matches matches 0..9 run scoreboard players operation #priceF ss.matches += #price4 ss.matches
execute unless score #failed ss.matches matches 1 if score #price4 ss.matches matches 10.. run function signshops:operations/interact/init/buy/verify/invalid

#Query Length
data remove storage suso.str:io out[0]
execute store result score #price3 ss.matches run data get storage suso.str:io out

# If Length > 0 && Valid, loop
execute if score #price3 ss.matches matches 1.. if score #price4 ss.matches matches 0..9 run function signshops:operations/interact/init/buy/verify/loop_input