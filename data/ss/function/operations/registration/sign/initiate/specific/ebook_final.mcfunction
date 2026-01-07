## SignShops Stage 2 - Enchanted Book Initiation - Naming
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/specific/ebook_name2
# Called by:
#   - ss:operations/registration/sign/initiate/specific/ebook
# Returns:
#   1 - Function compiled.
# Description:
#   <> Changes the sign to reflect the name and level of the enchantment, after trimming

## Commands

$data modify block ~ ~ ~ front_text.messages[1] set value [{text:'$(name) $(extra)'}]
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.ready set value true
return 1