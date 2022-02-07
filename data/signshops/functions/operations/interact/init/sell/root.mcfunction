## INIT SELL SIGN FUNCTION
# Context: Player @ Sign Location
# Calls:
#   - None
# Called by:
#   - signshops:operations/interact/init/root
# Description:
#   <> Initializes a Sell sign for operation

## COMMANDS

data modify block ~ ~ ~ Text1 set value '{"text":"[Sell]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'
data modify block ~ ~ ~ Text2 set value '{"text":"Insert Item(s)","color":"gray","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'
data modify block ~ ~ ~ Text3 set value '{"text":"Set Quantity","color":"gray","clickEvent":{"action":"run_command","value":"/trigger ss.interact set 1"}}'