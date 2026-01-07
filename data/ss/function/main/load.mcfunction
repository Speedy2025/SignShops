## Signshops Load
# Context: None
# Calls:
#   - None
# Called by:
#   - None
# Description:
#   <> Used to load the datapack's commands

## Commands
# Technical Scoreboards
scoreboard objectives add ss.raycast dummy ["",{text:"ss.raycast",color:"gray",italic:true}]
scoreboard objectives add ss.stock dummy ["",{text:"ss.stock",color:"gray",italic:true}]
scoreboard objectives add ss.target dummy ["",{text:"ss.target",color:"gray",italic:true}]

# Constant Values
scoreboard objectives add ss.CONSTANT dummy ["",{text:"ss.CONSTANT",color:"gray",italic:true}]
scoreboard players set #const.10 ss.CONSTANT 10
scoreboard players set #const.n1 ss.CONSTANT -1

# API Scoreboards
scoreboard objectives add ss.balance trigger ["",{text:"Balance",color:"green"}]
scoreboard objectives add ss.retrieve trigger ["",{text:"Retrieve",color:"green"}]
scoreboard objectives add ss.transfer trigger ["",{text:"Transfer",color:"green"}]
scoreboard objectives add ss.help trigger ["",{text:"SignShops - Help",color:"green",bold:true}]
scoreboard objectives add ss.interact trigger ["",{text:"Interact",color:"green"}]

# Forceload
forceload add 0 0
fill -1 -64 -1 1 -63 1 minecraft:bedrock
setblock 0 -64 0 minecraft:yellow_shulker_box


# Broadcast Completion
tellraw @a ["",{text:"[Sign Shop]",color:"green"},{text:" Finished loading SignShops v2"}]