## INIT BUY SIGN FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/init/root
# Description:
#   <> Initializes a buy sign for operation

## COMMANDS

data modify block ~ ~ ~ Text1 set value '{"text":"[Buy]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'
data modify block ~ ~ ~ Text2 set value '{"text":"Insert Item(s)","color":"gray","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'
data modify block ~ ~ ~ Text3 set value '{"text":"Set Quantity","color":"gray","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'