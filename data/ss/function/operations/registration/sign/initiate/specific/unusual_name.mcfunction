## SignShops Stage 2 - Unusual Initiation
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/specific/unusual_name
# Called by:
#   - ss:operations/registration/sign/initiate/specific/unusual
# Returns:
#   1 - failure
#   <None> - success
# Description:
#   <> Names the sign with the given unusual name

$data modify block ~ ~ ~ front_text.messages[1] set value [{text:'$(val)'}]
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.ready set value true
return 1