## LOAD FUNCTION
# Context: None
# Calls:
#   - None
# Called by:
#   - None
# Description:
#   <> Used to initialize scoreboards


## COMMANDS
# Technical Scoreboards
scoreboard objectives add ss.raycast dummy [{"text":"ss.raycast","color":"gray","italic":true}]
scoreboard objectives add ss.matches dummy [{"text":"ss.matches","color":"gray","italic":true}]
scoreboard objectives add ss.stock dummy [{"text":"ss.stock","color":"gray","italic":true}]
scoreboard objectives add ss.CONSTANT dummy [{"text":"ss.CONSTANT","color":"gray","italic":true}]
scoreboard objectives add ss.destination dummy [{"text":"ss.destination","color":"gray","italic":true}]
scoreboard players set #const.10 ss.CONSTANT 10
scoreboard players set #const.n1 ss.CONSTANT -1

#API Scoreboards
scoreboard objectives add ss.currency dummy [{"text":"Currency","color":"green"}]
scoreboard objectives add ss.interact trigger [{"text":"Interact","color":"green"}]
scoreboard objectives add ss.retrieve trigger [{"text":"Retrieve","color":"green"}]
scoreboard objectives add ss.balance trigger [{"text":"Balance","color":"green"}]
scoreboard objectives add ss.transfer trigger [{"text":"Transfer","color":"green"}]

#Forceload
forceload add 29999999 43376
execute in minecraft:overworld run setblock 29999984 0 43378 yellow_shulker_box[facing=down] replace

schedule function signshops:force_load 1s replace