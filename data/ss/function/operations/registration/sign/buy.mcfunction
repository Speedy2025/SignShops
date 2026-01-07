## SignShops Stage 1 - Buy Initiation
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/validate/start
# Called by:
#   - ss:operations/registration/sign/start
# Returns:
#   0 - Initiation failed.
#   1 - Function completed, no issueus.
# Description:
#   <> Adjusts the sign and tags it for buying.

## Commands

summon marker ~ ~ ~ {Tags:['ss.marker'],data:{ss:{type: "buy", ready: false, price: 0, stock: 0, id: "minecraft:air", amount: 0, components: {}}}}
data modify block ~ ~ ~ is_waxed set value true
data modify block ~ ~ ~ front_text.color set value "black"
data modify block ~ ~ ~ front_text.messages[0] set value [{text:"[Buy]",color:"gold",click_event:{action:"run_command",command:"/trigger ss.interact set -1"}}]

return run function ss:operations/registration/sign/validate/start