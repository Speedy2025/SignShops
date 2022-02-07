## REGISTER FUNCTION
# Context: None
# Calls:
#   - None
# Called by:
#   - signshops:main/tick
# Description:
#   <> Registers players with PlayerDB

## COMMANDS
tag @s add ss.init
tag @s remove ss.init.cache
function #rx.playerdb:api/v2/get/self
data modify storage rx:io player.data.signshops set value {collect:{currency:0,Items:[]}}
function #rx.playerdb:api/v2/save/self